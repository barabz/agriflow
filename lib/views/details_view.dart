import 'package:flutter/material.dart';
import 'dart:math';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        title: const Text(
          'Water Quality Details',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.file_download_outlined,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.calendar_today_outlined,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopOverviewCard(),
              const SizedBox(height: 24),
              _buildMetricsList(),
              const SizedBox(height: 24),
              _buildTrendSection(),
              const SizedBox(height: 24),
              _buildRecommendedAction(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // This single card now combines the header and the gauge chart
  Widget _buildTopOverviewCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header Section inside the card
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "North Canal A",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Station ID: NC-A01",
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.check, color: Colors.white, size: 14),
                    SizedBox(width: 4),
                    Text(
                      "Safe for Irrigation",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40), // Increased spacing before the gauge
          // Gauge Chart & Text separated by a Stack
          Center(
            child: SizedBox(
              width: 260, // Increased width for a wider arc
              height: 150, // Taller overall box to allow text to sit lower
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // 1. The Arc (Anchored to the top)
                  Positioned(
                    top: 0,
                    child: CustomPaint(
                      size: const Size(
                        260,
                        130,
                      ), // Exactly half-circle dimensions
                      painter: GaugePainter(percentage: 0.92),
                    ),
                  ),
                  // 2. The Text (Anchored safely at the bottom)
                  Positioned(
                    bottom: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Overall Quality Score",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          "92%",
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height:
                                1.1, // Tightens the line height to reduce visual bulk
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Excellent",
                          style: TextStyle(
                            color: Colors.green[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _buildMetricRow(
            Icons.water_drop,
            Colors.blue,
            "pH Level",
            "(6.0 - 7.5)",
            "6.8",
            "",
            "Good",
          ),
          Divider(height: 1, color: Colors.grey.shade100),
          _buildMetricRow(
            Icons.waves,
            Colors.cyan,
            "Turbidity",
            "(< 10 NTU)",
            "4",
            "NTU",
            "Good",
          ),
          Divider(height: 1, color: Colors.grey.shade100),
          _buildMetricRow(
            Icons.thermostat,
            Colors.redAccent,
            "Temperature",
            "(< 35 °C)",
            "27",
            "°C",
            "Good",
          ),
          Divider(height: 1, color: Colors.grey.shade100),
          _buildMetricRow(
            Icons.scatter_plot,
            Colors.blueGrey,
            "TDS",
            "(< 500 ppm)",
            "240",
            "ppm",
            "Good",
          ),
          Divider(height: 1, color: Colors.grey.shade100),
          _buildMetricRow(
            Icons.stacked_line_chart,
            Colors.teal,
            "Water Level",
            "(Optimal)",
            "Normal",
            "",
            "Good",
          ),
        ],
      ),
    );
  }

  Widget _buildMetricRow(
    IconData icon,
    Color iconColor,
    String title,
    String range,
    String value,
    String unit,
    String status,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  range,
                  style: TextStyle(color: Colors.grey[500], fontSize: 11),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  if (unit.isNotEmpty) ...[
                    const SizedBox(width: 2),
                    Text(
                      unit,
                      style: TextStyle(color: Colors.grey[600], fontSize: 11),
                    ),
                  ],
                ],
              ),
            ],
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: Colors.green[700],
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
        ],
      ),
    );
  }

  Widget _buildTrendSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Water Quality Trend (Last 24 Hours)",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 150,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: CustomPaint(
            size: const Size(double.infinity, 120),
            painter: LineChartPainter(),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedAction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recommended Action",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.shade200),
          ),
          child: Row(
            children: [
              Icon(Icons.eco, color: Colors.green[700], size: 28),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  "Continue irrigation. Water quality is good for crop growth.",
                  style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// --- Custom Painters Below ---

class GaugePainter extends CustomPainter {
  final double percentage;
  GaugePainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade200
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    Offset center = Offset(size.width / 2, size.height);
    double radius = size.width / 2;
    Rect arcRect = Rect.fromCircle(center: center, radius: radius);

    // Draw the grey background arc
    canvas.drawArc(
      arcRect,
      pi, // Start angle (left)
      pi, // Sweep angle (half circle)
      false,
      backgroundPaint,
    );

    // Create a SweepGradient for the green -> yellow -> red transition
    const gradient = SweepGradient(
      startAngle: pi,
      endAngle: 2 * pi,
      colors: [Colors.green, Colors.yellow, Colors.red],
      stops: [
        0.0,
        0.5,
        1.0,
      ], // 0.0 is left (start), 0.5 is top-center, 1.0 is right (end)
    );

    Paint foregroundPaint = Paint()
      ..shader = gradient.createShader(arcRect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    // Draw active percentage arc with the gradient shader applied
    canvas.drawArc(arcRect, pi, pi * percentage, false, foregroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Colors.green.shade600
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    Paint dotPaint = Paint()
      ..color = Colors.green.shade700
      ..style = PaintingStyle.fill;

    Paint axisPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1;

    // Draw Grid Lines (Y Axis Mock)
    double stepY = size.height / 2;
    for (int i = 0; i <= 2; i++) {
      double y = i * stepY;
      canvas.drawLine(Offset(20, y), Offset(size.width, y), axisPaint);

      // Draw Y axis labels
      TextPainter tp = TextPainter(
        text: TextSpan(
          text: "${100 - (i * 50)}",
          style: TextStyle(color: Colors.grey[500], fontSize: 10),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(0, y - 6));
    }

    // Mock Data Points mapping to the trend line in the image
    List<double> data = [0.2, 0.4, 0.3, 0.8, 0.6, 0.5, 0.4, 0.45, 0.55];
    double stepX = (size.width - 30) / (data.length - 1);

    Path path = Path();
    List<Offset> points = [];

    for (int i = 0; i < data.length; i++) {
      double x = 30 + (i * stepX);
      double y = size.height - (data[i] * size.height);
      points.add(Offset(x, y));

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    // Draw Line
    canvas.drawPath(path, linePaint);

    // Draw Dots
    for (var point in points) {
      canvas.drawCircle(point, 4, dotPaint);
      canvas.drawCircle(point, 2, Paint()..color = Colors.white); // Inner dot
    }

    // Draw X Axis labels
    List<String> xLabels = ['12 AM', '6 AM', '12 PM', '6 PM', 'Now'];
    double labelStep = (size.width - 30) / (xLabels.length - 1);

    for (int i = 0; i < xLabels.length; i++) {
      TextPainter tp = TextPainter(
        text: TextSpan(
          text: xLabels[i],
          style: TextStyle(color: Colors.grey[500], fontSize: 10),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(
        canvas,
        Offset(30 + (i * labelStep) - (tp.width / 2), size.height + 8),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
