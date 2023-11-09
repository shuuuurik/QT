import sys
from pathlib import Path

from PySide6.QtCore import QObject, Slot, Signal, Property
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement

QML_IMPORT_NAME = "myModule"
QML_IMPORT_MAJOR_VERSION = 1

@QmlElement
class MyClass(QObject):
    textChanged = Signal()

    def __init__(self):
        QObject.__init__(self)
        self.my_text = ""
        self.textChanged.connect(self.printText)
        self.textChanged.emit()

    def setText(self, text):
        self.my_text = text
        self.textChanged.emit()

    def getText(self):
        return self.my_text

    text = Property(str, getText, setText, notify=textChanged)

    @Slot()
    def printText(self):
        print(self.my_text)


if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    qml_file = Path(__file__).parent / 'view.qml'
    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
