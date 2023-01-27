from openpyxl.chart import ScatterChart, Reference, Series

class Functions:
    def print_header_x (sheet, columns, positionx, positiony):
        initialy = chr(ord(positiony)+1)
        currenty = ""
        for i in range(len(columns)):
            currenty = chr(ord(initialy)+i)
            sheet[f'{currenty}{positionx}'] = columns[i]
            #sheet[f'{letter}{positionx}'].border = Border(top=double, left=thin, right=thin, bottom=double)
        return initialy,currenty
    
    def print_header_y (sheet, rows, positionx, positiony):
        initialx = positionx+1
        currentx = 0
        for i in range(len(rows)):
            currentx = initialx+i
            sheet[f'{positiony}{currentx}'] = rows[i]
            #sheet[f'{positiony}{positionx+i+1}'].border = Border(top=double, left=thin, right=thin, bottom=double)
        return initialx, currentx

    def print_all_headers(sheet, columns, rows, positionx, positiony):
        initialy = chr(ord(positiony)+1)
        currenty = ""
        #Columns
        for i in range(len(columns)):
            currenty = chr(ord(initialy)+i)
            sheet[f'{currenty}{positionx}'] = columns[i]
        #Rows
        initialx = positionx+1
        currentx = 0
        for i in range(len(rows)):
            currentx = initialx+i
            sheet[f'{positiony}{currentx}'] = rows[i]

        return initialx, initialy
        
    def create_graph (name, sheet, positionx, positiony, minx, miny, maxx, maxy):
        chart1 = ScatterChart()

        chart1.title = name
        chart1.style = 13
        chart1.y_axis.title = "eje Y"
        chart1.x_axis.title = "Eje X"
        #Falta: Establecer rango de columnas
        xvalue = Reference(sheet,min_col=1, min_row=1, max_col=1, max_row=13)
        yvalue = Reference(sheet,min_col=2, min_row=1, max_col=2, max_row=13)

        ser = Series(yvalue,xvalue,title="Recta")

        chart1.series.append(ser)

        sheet.add_chart( chart1, (str(positionx)+ str(positiony)) )