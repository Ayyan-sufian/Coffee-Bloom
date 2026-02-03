import 'package:flutter/material.dart';

class CollageContainer extends StatelessWidget {
  final String image1; // Left image URL or asset path
  final String image2; // Top right image URL or asset path
  final String image3; // Bottom right image URL or asset path

  const CollageContainer({
    super.key,
    required this.image1,
    required this.image2,
    required this.image3,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,                 // important
      child: Container(
        width: 300, // Adjust width as needed
        height: 200, // Adjust height as needed
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(110),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Left image
            ClipPath(
              clipper: LeftClipper(),
              child: Image.network(
                image1,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.error),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Top right image
            ClipPath(
              clipper: TopRightClipper(),
              child: Image.network(
                image2,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.error),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Bottom right image
            ClipPath(
              clipper: BottomRightClipper(),
              child: Image.network(
                image3,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.error),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Dividers
            CustomPaint(
              painter: DividerPainter(),
            ),
            // Badge
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.brown[800],
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '16',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.65, 0);
    path.lineTo(size.width * 0.55, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class TopRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.65, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.55);
    path.lineTo(size.width * 0.6, size.height * 0.5);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class BottomRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.6, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.55);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.55, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class DividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    // Main diagonal divider
    final mainPath = Path()
      ..moveTo(size.width * 0.65, 0)
      ..lineTo(size.width * 0.55, size.height);
    canvas.drawPath(mainPath, paint);

    // Right tilted divider
    final rightPath = Path()
      ..moveTo(size.width * 0.6, size.height * 0.55)
      ..lineTo(size.width, size.height * 0.5);
    canvas.drawPath(rightPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}