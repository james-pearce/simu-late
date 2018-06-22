import xlwings as xw


def main():
    wb = xw.Book.caller()
    sht = wb.sheets['temp_sheets']
    read_value = wb.sheets[0].range("D5").options(numbers=int).value
    wb.sheets[0].range("D6").value = read_value * 2


