from reportlab.lib import colors
from reportlab.lib.enums import TA_CENTER, TA_LEFT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
from reportlab.lib.units import mm
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle


OUTPUT = r"F:\laragon\www\IoT\output\pdf\attendance-punch-list-26-sep-2026.pdf"

PUNCHES = [
    (1, "4:26:10 PM", "Nuryl Kaiser Munna"),
    (2, "4:29:52 PM", "Aparup Barua"),
    (3, "4:33:08 PM", "Nuryl Kaiser Munna"),
    (4, "4:37:55 PM", "Aparup Barua"),
    (5, "4:39:22 PM", "Arindam Das"),
    (6, "4:42:11 PM", "Khaleda Akhter"),
    (7, "4:43:18 PM", "Khaleda Akhter"),
    (8, "4:46:56 PM", "Antar Nandi"),
    (9, "4:47:50 PM", "Khaleda Akhter"),
    (10, "4:52:33 PM", "Arindam Das"),
    (11, "4:52:59 PM", "Khaleda Akhter"),
    (12, "4:53:35 PM", "Nuryl Kaiser Munna"),
    (13, "4:55:05 PM", "Arindam Das"),
    (14, "4:56:25 PM", "Antar Nandi"),
    (15, "4:58:08 PM", "Antar Nandi"),
    (16, "4:59:40 PM", "Arindam Das"),
    (17, "4:59:55 PM", "Nuryl Kaiser Munna"),
    (18, "5:00:14 PM", "Khaleda Akhter"),
    (19, "5:04:08 PM", "Arindam Das"),
    (20, "5:07:45 PM", "Khaleda Akhter"),
    (21, "5:08:45 PM", "Antar Nandi"),
    (22, "5:10:29 PM", "Antar Nandi"),
    (23, "5:13:27 PM", "Arindam Das"),
    (24, "5:14:02 PM", "Nuryl Kaiser Munna"),
    (25, "5:17:19 PM", "Antar Nandi"),
    (26, "5:18:46 PM", "Khaleda Akhter"),
    (27, "5:19:13 PM", "Arindam Das"),
    (28, "5:22:03 PM", "Nuryl Kaiser Munna"),
    (29, "5:22:14 PM", "Antar Nandi"),
]


styles = getSampleStyleSheet()
title = ParagraphStyle("Title", parent=styles["Title"], fontName="Helvetica-Bold", fontSize=18,
                       leading=22, textColor=colors.HexColor("#173B63"), alignment=TA_LEFT, spaceAfter=4)
subtitle = ParagraphStyle("Subtitle", parent=styles["Normal"], fontName="Helvetica", fontSize=9,
                          leading=12, textColor=colors.HexColor("#475569"), spaceAfter=12)
footer = ParagraphStyle("Footer", parent=styles["Normal"], fontName="Helvetica", fontSize=8,
                        textColor=colors.HexColor("#64748B"), alignment=TA_CENTER, spaceBefore=9)

document = SimpleDocTemplate(
    OUTPUT,
    pagesize=A4,
    leftMargin=18 * mm,
    rightMargin=18 * mm,
    topMargin=16 * mm,
    bottomMargin=15 * mm,
)

table_data = [["Serial", "Punch time", "Employee"]] + [[str(n), time, employee] for n, time, employee in PUNCHES]
table = Table(table_data, colWidths=[25 * mm, 48 * mm, 101 * mm], repeatRows=1, rowHeights=[8 * mm] + [6.1 * mm] * len(PUNCHES))
table.setStyle(TableStyle([
    ("BACKGROUND", (0, 0), (-1, 0), colors.HexColor("#173B63")),
    ("TEXTCOLOR", (0, 0), (-1, 0), colors.white),
    ("FONTNAME", (0, 0), (-1, 0), "Helvetica-Bold"),
    ("FONTSIZE", (0, 0), (-1, -1), 9),
    ("ALIGN", (0, 0), (1, -1), "CENTER"),
    ("ALIGN", (2, 0), (2, -1), "LEFT"),
    ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
    ("GRID", (0, 0), (-1, -1), 0.35, colors.HexColor("#CBD5E1")),
    ("ROWBACKGROUNDS", (0, 1), (-1, -1), [colors.white, colors.HexColor("#F8FAFC")]),
    ("LEFTPADDING", (0, 0), (-1, -1), 6),
    ("RIGHTPADDING", (0, 0), (-1, -1), 6),
    ("TOPPADDING", (0, 0), (-1, -1), 2),
    ("BOTTOMPADDING", (0, 0), (-1, -1), 2),
]))

document.build([
    Paragraph("ZKT Attendance Punch List", title),
    Paragraph("26 September 2026 - 29 biometric punches in chronological order", subtitle),
    table,
    Paragraph("Prepared for attendance-report cross-checking", footer),
])
