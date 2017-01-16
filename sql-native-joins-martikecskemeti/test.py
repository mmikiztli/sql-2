#!/usr/bin/python3
import subprocess
import re

stat = {
    'correct': 0,
    'incorrect': 0
}


def run(command_list):
    process = subprocess.run(command_list, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    error = process.stderr.decode("utf-8")  # returning the stderr text, if any
    if len(error) > 0:
        return error
    return process.stdout.decode("utf-8")


def run_sql_file(file_name):
    return run(['psql', '-f', file_name])


def build_regex_for_line(line_elements):
    regex = r'\s' + line_elements[0].strip()
    for elem in line_elements[1:]:
        regex += r'\s*\|\s' + elem.strip()

    return regex


def clear_sql_output_line(line):
    return re.sub(r'\s*\|\s*', ', ', line)


def test_output(checked, headers, expected, prefix_lines=None):
    splitted = checked.split('\n')

    if prefix_lines is not None:
        for i in range(len(prefix_lines)):
            if prefix_lines[i] != splitted[i]:
                _expected = prefix_lines[i]
                got = clear_sql_output_line(splitted[i]).strip()
                if _expected != got:
                    return {
                        'error': 'Output error before the SELECT',
                        'expected': _expected + ' | length: ' + str(len(_expected)),
                        'got': got + ' | length: ' + str(len(got))
                    }

        for i in range(len(prefix_lines)):
            splitted.pop(0)

    if re.match(build_regex_for_line(headers), splitted[0]) is None:
        _expected = ', '.join(headers)
        got = clear_sql_output_line(splitted[0]).strip()
        if _expected != got:
            return {
                'error': 'Error in headers',
                'expected': _expected + ' | length: ' + str(len(_expected)),
                'got': got + ' | length: ' + str(len(got))
            }

    data_lines = splitted[2:-3]
    if len(data_lines) != len(expected):
        return {
            'error': 'Wrong number of output lines',
            'expected': str(len(expected)) + ' lines',
            'got': str(len(data_lines)) + ' lines'
        }

    for i in range(len(data_lines)):
        if re.match(build_regex_for_line(expected[i]), data_lines[i]) is None:
            _expected = ', '.join(expected[i])
            got = clear_sql_output_line(data_lines[i]).strip()
            if _expected != got:
                return {
                    'error': 'Output error',
                    'expected': _expected + ' | length: ' + str(len(_expected)),
                    'got': got + ' | length: ' + str(len(got))
                }

    return True


def test_sql_file(file_name, headers, expected_values, prefix_lines=None):
    global stat

    output = run_sql_file(file_name)
    test_result = test_output(output, headers, expected_values, prefix_lines)
    if test_result is True:
        print(file_name + ' works as expected')
        stat['correct'] += 1
    else:
        print('\n!! Error detected')
        print('File: ', file_name)
        print('Error: ' + test_result['error'])
        print('Expected: ' + test_result['expected'])
        print('Got: ' + test_result['got'])
        print('Full output:\n' + output + '\n')
        stat['incorrect'] += 1


def main():
    global stat

    # build tables and populate data
    run_sql_file('clean-db.sql')
    run_sql_file('build-mentors-table.sql')
    run_sql_file('build-applicants-table.sql')
    run_sql_file('build-schools-table.sql')
    run_sql_file('build-applicants_mentors-table.sql')

    # RUN TESTS ======================================
    test_sql_file(
        '1-list-mentors-with-school.sql',
        ['first_name', 'last_name', 'name', 'country'],
        [
            ['Attila', 'Molnár', 'Codecool Msc', 'Hungary'],
            ['Pál', 'Monoczki', 'Codecool Msc', 'Hungary'],
            ['Sándor', 'Szodoray', 'Codecool Msc', 'Hungary'],
            ['Dániel', 'Salamon', 'Codecool BP', 'Hungary'],
            ['Miklós', 'Beöthy', 'Codecool BP', 'Hungary'],
            ['Tamás', 'Tompa', 'Codecool BP', 'Hungary'],
            ['Mateusz', 'Ostafil', 'Codecool Krak', 'Poland']
        ]
    )

    test_sql_file(
        '1b-list-mentors-all-school.sql',
        ['first_name', 'last_name', 'name', 'country'],
        [
            ['Attila', 'Molnár', 'Codecool Msc', 'Hungary'],
            ['Pál', 'Monoczki', 'Codecool Msc', 'Hungary'],
            ['Sándor', 'Szodoray', 'Codecool Msc', 'Hungary'],
            ['Dániel', 'Salamon', 'Codecool BP', 'Hungary'],
            ['Miklós', 'Beöthy', 'Codecool BP', 'Hungary'],
            ['Tamás', 'Tompa', 'Codecool BP', 'Hungary'],
            ['Mateusz', 'Ostafil', 'Codecool Krak', 'Poland'],
            ['', '', 'Codecool Mad', 'Spain']
        ]
    )

    test_sql_file(
        '2-number-of-mentors.sql',
        ['country', 'count'],
        [
            ['Hungary', '6'],
            ['Poland', '1']
        ]
    )

    test_sql_file(
        '3-contact-persons.sql',
        ['name', 'first_name', 'last_name'],
        [
            ['Codecool BP', 'Dániel', 'Salamon'],
            ['Codecool Krak', 'Mateusz', 'Ostafil'],
            ['Codecool Msc', 'Attila', 'Molnár']
        ]
    )

    test_sql_file(
        '4-applicants-filtered.sql',
        ['first_name', 'application_code', 'creation_date'],
        [
            ['Jane', '56882', '2016-05-23'],
            ['Carol', '70730', '2016-04-11'],
            ['Jemima', '10384', '2016-03-12'],
            ['Arsenio', '39220', '2016-03-01'],
            ['Ifeoma', '65603', '2016-01-10']
        ]
    )

    test_sql_file(
        '5-applicants-with-mentors.sql',
        ['first_name', 'application_code', 'mentor_first_name', 'mentor_last_name'],
        [
            ['Dominique', '61823', 'Attila', 'Molnár'],
            ['Jemima', '58324', 'Attila', 'Molnár'],
            ['Zeph', '61349', 'Pál', 'Monoczki'],
            ['Joseph', '12916', 'Sándor', 'Szodoray'],
            ['Ifeoma', '65603', 'Dániel', 'Salamon'],
            ['Arsenio', '39220', 'Miklós', 'Beöthy'],
            ['Jemima', '10384', 'Miklós', 'Beöthy'],
            ['Carol', '70730', 'Tamás', 'Tompa'],
            ['Jane', '56882', 'Mateusz', 'Ostafil'],
            ['Ursa', '91220', 'None', 'None'],
        ]
    )

    print(
        '\n\n' + str(stat['correct'] + stat['incorrect']) +
        ' tests ran: \n\t' + str(stat['correct']) +
        ' correct\n\t' + str(stat['incorrect']) + ' incorrect')

    return stat

if __name__ == '__main__':
    main()
