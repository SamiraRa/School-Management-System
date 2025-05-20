import 'package:flutter/material.dart';
import 'package:school_management_application/constants.dart';
import 'package:school_management_application/model/fees_pay_model.dart';
import 'package:school_management_application/utils/data.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class FeesPaymentScreen extends StatefulWidget {
  const FeesPaymentScreen({super.key});

  @override
  State<FeesPaymentScreen> createState() => _FeesPaymentScreenState();
}

class _FeesPaymentScreenState extends State<FeesPaymentScreen> {
  TextEditingController studentIdController = TextEditingController();
  TextEditingController sessionController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  TextEditingController groupController = TextEditingController();
  String _selectedPaymentMethod = 'Card';
  // String _selectedPaymentMethod2 = 'Mobile Banking';
  FeesPayModel? feesPayData;
  List<Due> due = [];
  double totalDue = 0.00;
  bool show = false;
  // List<FeesPayModel> feesPayModel = [];

  @override
  void initState() {
    feesPayData = feesPayModelFromJson(DemoData.feesJson);
    setState(() {
      due = feesPayData!.due;
      for (var element in due) {
        totalDue += double.parse(element.tuitionFees) + double.parse(element.examFees);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar('Fees Payment', () => Navigator.of(context).pop()),
        body: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: Row(
                  children: [
                    // Expanded(child: Text("Student Id:")),
                    Expanded(
                      child: TextFormField(
                        controller: studentIdController,
                        decoration: const InputDecoration(
                          labelText: "Enter Student Id",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: sessionController,
                        decoration: const InputDecoration(
                          labelText: "Enter Session",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 45,
                child: Row(
                  children: [
                    // Expanded(child: Text("Student Id:")),
                    Expanded(
                      child: TextFormField(
                        controller: studentNameController,
                        decoration: const InputDecoration(
                          labelText: "Enter Student Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: groupController,
                        decoration: const InputDecoration(
                          labelText: "Enter Group",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (studentIdController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please Enter Student Id"),
                      ));
                    } else if (sessionController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please Enter Session"),
                      ));
                    } else if (studentNameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please Enter Student Name"),
                      ));
                    } else if (groupController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please Enter Group"),
                      ));
                    } else {
                      if (studentIdController.text == "1" &&
                          sessionController.text == "1" &&
                          studentNameController.text == "1" &&
                          groupController.text == "1") {
                        show = true;
                        setState(() {});
                      }
                    }
                  },
                  child: const Text("Search",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              !show
                  ? const SizedBox()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Selct Payment Method",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        radioButtons(),
                        const SizedBox(
                          height: 10,
                        ),
                        feesPayData == null
                            ? const SizedBox()
                            : Table(
                                border: TableBorder.all(
                                  // borderRadius: BorderRadius.all(Radius.circular(15)),
                                  color: const Color.fromARGB(255, 66, 117, 66),
                                ),
                                children: [
                                  headerRow('SL', 'Month Name', 'Due Amount'),
                                  ...feesPayData!.due.map((e) {
                                    return TableRow(
                                      children: [
                                        const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: Text("",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(e.month.toString(),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(
                                                (double.parse(e.examFees) + double.parse(e.tuitionFees))
                                                    .toStringAsFixed(2),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                  TableRow(children: [
                                    const Text(""),
                                    const Text("Total Amount",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(totalDue.toStringAsFixed(2),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    ),
                                  ])
                                ],
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kPrimaryColor,
                                  fixedSize: const Size(120, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  printPage();
                                },
                                child: const Text(
                                  "Print",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                            const SizedBox(width: 10),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(120, 40),
                                  backgroundColor: kPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  String text = "This Service is currently not available";

                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(builder: (context, setState1) {
                                        // Future.delayed(const Duration(seconds: 1), () {
                                        // text = "Payment is Failed.\n Please try again later";
                                        //   if (!mounted) setState1(() {});
                                        // });
                                        return AlertDialog(
                                          title: Text("$_selectedPaymentMethod Payment "),
                                          content: Row(
                                            children: [
                                              // SizedBox(
                                              //   height: 20,
                                              //   width: 20,
                                              //   child: CircularProgressIndicator(
                                              //     color: Colors.blue,
                                              //   ),
                                              // ),
                                              const SizedBox(width: 10),
                                              Text(text),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Close"),
                                            ),
                                          ],
                                        );
                                      });
                                    },
                                  );
                                },
                                child: const Text("Pay Now",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )))
                          ],
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }

  void printPage() async {
    final doc = pw.Document();

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(24),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Fees Payment Slip', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 16),
                pw.Text('Student Id: ${studentIdController.text}'),
                pw.Text('Session: ${sessionController.text}'),
                pw.Text('Student Name: ${studentNameController.text}'),
                pw.Text('Group: ${groupController.text}'),
                pw.Text('Payment Method: $_selectedPaymentMethod'),
                pw.SizedBox(height: 16),
                pw.Table(
                  border: pw.TableBorder.all(),
                  children: [
                    pw.TableRow(
                      decoration: const pw.BoxDecoration(color: PdfColors.green400),
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4),
                          child: pw.Text('Month', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4),
                          child: pw.Text('Tuition Fees', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4),
                          child: pw.Text('Exam Fees', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4),
                          child: pw.Text('Total', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        ),
                      ],
                    ),
                    ...due.map((e) => pw.TableRow(
                          children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(4),
                              child: pw.Text(e.month),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(4),
                              child: pw.Text(e.tuitionFees),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(4),
                              child: pw.Text(e.examFees),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(4),
                              child: pw.Text(
                                (double.parse(e.tuitionFees) + double.parse(e.examFees)).toStringAsFixed(2),
                              ),
                            ),
                          ],
                        )),
                    pw.TableRow(
                      decoration: const pw.BoxDecoration(color: PdfColors.grey300),
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4),
                          child: pw.Text(''),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4),
                          child: pw.Text(''),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4),
                          child: pw.Text('Total', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(4),
                          child:
                              pw.Text(totalDue.toStringAsFixed(2), style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(height: 24),
                pw.Text('Thank you for your payment!', style: pw.TextStyle(fontStyle: pw.FontStyle.italic)),
              ],
            ),
          );
        },
      ),
    );

    // Show the PDF preview or print dialog
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());

    // doc.addPage(pw.Page(
    //     pageFormat: PdfPageFormat.a4,
    //     build: (pw.Context context) {
    //       return pw.Center(
    //         child: pw.Text('Hello World'),
    //       ); // Center
    //     })); // Page
  }

  TableRow headerRow(String cell1, String cell2, String cell3) {
    return TableRow(
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Color.fromARGB(255, 66, 117, 66),
      ),
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(cell1,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(cell2,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(cell3,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      ],
    );
  }

  Row radioButtons() {
    return Row(
      children: [
        Radio<String>(
          value: 'Card',
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
          },
        ),
        const Text('Card'),
        const SizedBox(width: 20),
        Radio<String>(
          value: 'Mobile Banking',
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
          },
        ),
        const Text('Mobile Banking'),
        const SizedBox(width: 20),
        Radio<String>(
          value: 'Cash',
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              _selectedPaymentMethod = value!;
            });
          },
        ),
        const Text('Cash'),
      ],
    );
  }
}
