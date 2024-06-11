# Godot Python Aubio Real-Time Pitch Detection
This real-time Pitch Detector is a Python script that runs from within [Godot 4.3]([url](https://godotengine.org/download/preview/)).

It turns on the microphone using [pyaudio]([url](https://pypi.org/project/PyAudio/)), runs [aubio]([url](https://aubio.org/download)).pitch on the stream of incoming samples, then prints the detected pitch in real-time.

A simple and useful example showing how to stream the output of an external program into Godot using [OS.execute_with_pipe()]([url](https://docs.godotengine.org/en/latest/classes/class_os.html#class-os-method-execute-with-pipe))

(Only tested on macOS.)

<img width="658" alt="Screenshot 2024-06-11 at 5 25 53 PM" src="https://github.com/jonathanngkh/godot-python-aubio-pitch-detection/assets/11219915/bb33a701-20cb-44e1-957b-43e0a0bca02e">

### Libraries:
- [NumPy]([url](https://numpy.org/install/)) for signal processing
- [PyAudio]([url](https://pypi.org/project/PyAudio/)) for accessing the microphone
- [aubio]([url](https://aubio.org/download))) for pitch detection
