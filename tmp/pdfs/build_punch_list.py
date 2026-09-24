from reportlab.lib import colors
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import mm
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle

output_path = r"F:\laragon\www\IoT\output\pdf\zkt-punch-list-24-sep-2026.pdf"
punches = [
    (1, "3:14:48 PM", "Antar Nandi", "1"),
    (2, "3:17:00 PM", "Antar Nandi", "1"),
    (3, "3:20:18 PM", "Nurul Kaiser Munna", "2"),
    (4, "3:26:13 PM", "Antar Nandi", "1"),
    (5, "3:29:16 PM", "Antar Nandi", "1"),
    (6, "3:39:17 PM", "Nurul Kaiser Munna", "2"),
    (7, "3:42:13 PM", "Nurul Kaiser Munna", "2"),
    (8, "3:48:59 PM", "Nurul Kaiser Munna", "2"),
    (9, "3:50:46 PM", "Nurul Kaiser Munna", "2"),
    (10, "3:53:33 PM", "Nurul Kaiser Munna", "2"),
    (11, "3:54:44 PM", "Nurul Kaiser Munna", "2"),
    (12, "3:59:41 PM", "Antar Nandi", "1"),
    (13, "4:01:12 PM", "Nurul Kaiser Munna", "2"),
    (14, "4:04:03 PM", "Nurul Kaiser Munna", "2"),
    (15, "4:07:18 PM", "Antar Nandi", "1"),
    (16, "4:08:08 PM", "Nurul Kaiser Munna", "2"),
]

styles = getSampleStyleSheet()
styles.add(ParagraphStyle(name="Small", parent=styles["BodyText"], fontSize=9, leading=13, textColor=colors.HexColor("#334155")))
doc = SimpleDocTemplate(output_path, pagesize=A4, rightMargin=18*mm, leftMargin=18*mm, topMargin=16*mm, bottomMargin=16*mm)
story = [
    Paragraph("ZKT Attendance Punch List", styles["Title"]),
    Spacer(1, 4*mm),
    Paragraph("Date: 24 September 2026", styles["Small"]),
    Paragraph("ZKT User ID 1: Antar Nandi &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp; ZKT User ID 2: Nurul Kaiser Munna", styles["Small"]),
    Spacer(1, 6*mm),
]
data = [["Serial", "Punch Time", "Employee", "ZKT User ID"]] + [[str(n), t, name, zid] for n, t, name, zid in punches]
table = Table(data, colWidths=[25*mm, 45*mm, 75*mm, 30*mm], repeatRows=1)
table.setStyle(TableStyle([
    ("BACKGROUND", (0, 0), (-1, 0), colors.HexColor("#173b63")),
    ("TEXTCOLOR", (0, 0), (-1, 0), colors.white),
    ("FONTNAME", (0, 0), (-1, 0), "Helvetica-Bold"),
    ("FONTNAME", (0, 1), (-1, -1), "Helvetica"),
    ("FONTSIZE", (0, 0), (-1, -1), 10),
    ("ALIGN", (0, 0), (0, -1), "CENTER"),
    ("ALIGN", (-1, 0), (-1, -1), "CENTER"),
    ("GRID", (0, 0), (-1, -1), 0.35, colors.HexColor("#cbd5e1")),
    ("ROWBACKGROUNDS", (0, 1), (-1, -1), [colors.white, colors.HexColor("#f8fafc")]),
    ("TOPPADDING", (0, 0), (-1, -1), 7),
    ("BOTTOMPADDING", (0, 0), (-1, -1), 7),
]))
story.append(table)
story.append(Spacer(1, 6*mm))
story.append(Paragraph("Prepared for printing. Punches are ordered chronologically from tblAttendanceLog.", styles["Small"]))
doc.build(story)
