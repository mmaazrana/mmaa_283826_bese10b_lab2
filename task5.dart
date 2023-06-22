import 'dart:math';

class Point {
  final double _x, _y;

  const Point.origin()
      : _x = 0,
        _y = 0;

  const Point([this._x = 0, this._y = 0]);

  const Point.create({required double x, required double y})
      : _x = x,
        _y = y;

  double get xGetter => _x;
  double get yGetter => _y;
}

class Size {
  double _w, _h;

  Size.Zero()
      : _w = 0,
        _h = 0;

  Size([this._w = 0, this._h = 0]);

  Size.create({required double w, required double h})
      : _w = w,
        _h = h;

  double get hGetter => _h;
  double get wGetter => _w;

  void seth(h) {
    this._h = h;
  }

  void setB(w) {
    this._w = w;
  }

  factory Size.createSize(double w, double h) {
    if (w < 0 || h < 0) {
      throw Exception('Width and Height need to be non-negaitve');
    } else {
      return Size(w, h);
    }
  }
}

class Frame {
  Point _p;
  Size _s;

  factory Frame.creatFrame(double x, double y, double w, double h) {
    if (w < 0 || h < 0) {
      throw Exception('Width and Height need to be non-negaitve');
    } else {
      return Frame.create(p: Point(x, y), s: Size(w, h));
    }
  }

  Frame.empty() : this.create(p: Point.origin(), s: Size.Zero());

  Frame.create({required Point p, required Size s})
      : _p = p,
        _s = s;

  Point get pGetter => _p;
  Size get sGetter => _s;

  void setPoint(Point p) {
    this._p = p;
  }

  void setSize(Size s) {
    this._s = s;
  }
}

class Matrix {
  List<List<int>> matrixArr = [];

  Matrix(this.matrixArr);

  factory Matrix.fill(int rows, int cols) {
    var matrixArr = List.filled(rows, List.filled(cols, 0));
    return (Matrix(matrixArr));
  }

  factory Matrix.fillRandom(int rows, int cols) {
    var matrixArr = List<List<int>>.generate(
        rows, (i) => List<int>.generate(cols, (j) => Random().nextInt(999999)));
    return Matrix(matrixArr);
  }

  Matrix add(Matrix matrix) {
    throwException(rows != matrix.rows || cols != matrix.cols);
    Matrix result = Matrix.fill(rows, cols);
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result.matrixArr[i][j] = matrixArr[i][j] + matrix.matrixArr[i][j];
      }
    }
    return result;
  }

  Matrix subtract(Matrix matrix) {
    throwException(rows != matrix.rows || cols != matrix.cols);
    Matrix result = Matrix.fill(rows, cols);
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result.matrixArr[i][j] = matrixArr[i][j] - matrix.matrixArr[i][j];
      }
    }
    return result;
  }

  Matrix multiply(Matrix matrix) {
    throwException(cols != matrix.rows);
    Matrix result = Matrix.fill(rows, matrix.cols);
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < matrix.cols; j++) {
        for (int k = 0; k < cols; k++) {
          result.matrixArr[i][j] += matrixArr[i][k] * matrix.matrixArr[k][j];
        }
      }
    }
    return result;
  }

  Matrix transpose() {
    Matrix result = Matrix.fill(cols, rows);
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result.matrixArr[j][i] = matrixArr[i][j];
      }
    }
    return result;
  }

  operator +(Matrix matrix) {
    return add(matrix);
  }

  operator -(Matrix matrix) {
    return subtract(matrix);
  }

  operator *(Matrix matrix) {
    return multiply(matrix);
  }

  void throwException(bool condition) {
    if (condition) {
      throw Exception("Not Compatible");
    }
  }

  int get rows => matrixArr.length;
  int get cols => matrixArr[0].length;
  int get(int row, int col) => matrixArr[row][col];
  void set(int row, int col, int value) {
    matrixArr[row][col] = value;
  }

  @override
  String toString() {
    String result = "";
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result += "${matrixArr[i][j]} ";
      }
      result += "\n";
    }
    return result;
  }
}

void main() {
  Matrix mat1 = Matrix.fill(2, 2);
  mat1.set(0, 1, 2);
  mat1.set(1, 1, 1);
  mat1.set(1, 0, 0);
  mat1.set(1, 1, 0);
  Matrix mat2 = Matrix.fill(2, 2);
  mat2.set(0, 0, 7);
  mat2.set(0, 1, 0);
  mat2.set(1, 0, 9);
  mat2.set(1, 1, 6);
  Matrix mat3 = mat1 + mat2;
  print("Addition");
  print(mat3);
  Matrix mat4 = mat1 - mat2;
  print("Subtraction");
  print(mat4);
  Matrix mat5 = mat1 * mat2;
  print("Multiply");
  print(mat5);
}
