
// #let name = ""

#let title = [Silas Gagnon]

#set document(title: title, author: "Silas Gagnon", date: auto)

// #set page(margin: 1cm);

// #show grid: set pad(1cm)
#set figure(supplement: "", numbering: none)
#set page(margin: 1.5cm)
#show figure: set block(inset: 0.5em)
#set list(indent: 2em)
// #set grid(gutter:2em)

#let project(name, github, description, content, show-item: true) = {
  [
    #pad(
      bottom: 0.0cm,
      top: 0.1cm,
      [
        #heading(name, level: 2)
        #line(length: 1cm, stroke: color.teal)
        #text(fill: color.blue)[#link(github)]\
        #description
      ],
    )
    #content
  ]
}

#set text(
  font: "Atkinson Hyperlegible Next",
  size: 9.5pt,
)

#let section(title) = {
  [
    #align(right)[
      #heading(title, level: 1)
      #line(length: 5cm, stroke: color.teal)
    ]
  ]
}


#section[Project Portfolio -- Silas Gagnon]

#project(
  [Telometer],
  "https://github.com/gagnonsilas/telometer",
  [
    Designed and implemented a telemetry protocol and visualization dashboard
  ],
  [
    #figure(
      image("portfolio/Telometer3d.png"),
      caption: "3d Visualization dashboard using telometer. Shows 6 degree of freedom robot arm moving in 3d space.",
    )
    #grid(
      columns: (1fr, 0.9fr),
      figure(
        image("portfolio/CarPlot.png", width: 80%),
        caption: "Plot of WPI Goat Fast racing electric car acceleration test run",
      ),
      [
        - Capable of doing realtime data synchronization over any serial communication protocol (UART, CAN, UDP, Bluetooth, etc)
        - Implemented to send values directly as binary with only 2 bytes of overhead per packet
        - Used in many other projects for live visualization and tuning
          - Robotics courses with differential embedded robots and 6 degree of freedom arms
          - WPI Goat Fast Racing electric car live tuning and plotting
          - Used by another WPI student for a combat robot: Danger Doughnut #link( "https://github.com/gavin4d/dangerDoughnut")
          - Live plot of temperature for toaster oven PCB reflow station
        - Implemented the front end dashboard in zig using DearImGui with live 2d and 3d plots and visualizations
        - Packaged with the Nix package manager
      ],
    )
  ],
)

#pagebreak()
#project(
  [BFSK Communication],
  "",
  [
    Binary frequency shift keyed (BFSK ) communication protocal implemented on the Pluto SDR
  ],
  [
    #grid(
      columns: (1fr, 0.9fr),
      [
        #figure(
          image("portfolio/BFSK_Comms.png", width: 90%),
          caption: "TUI for BFSK communication",
        )
        #figure(
          image("portfolio/BFSK_Pluto.png", width: 90%),
          caption: "Two pluto SDRs wirelessly communicating over BFSK on 915MHz Ham Radio band",
        )
      ],
      [
        - Python script to send and recieve BFSK messages
        - Custom BFSK protocol with packet alignment and variable length messages
        - Tested up to 500MHz baud rate but currently limited by python send and receive buffer initialization
        - Packet header which includes
          - Packet alignment preamble
          - Amature radio callsign
          - Packet length
          - Unique message ID
        - Communication protocol designed to be very similar to Bluetooth Low Energy

        #figure(
          image("portfolio/BFSK_Decoding.png"),
          caption: [Recieved waveform frequency shift decoding],
        )
      ],
    )
  ],
)

#pagebreak()
#project(
  [Hydroflex],
  "",
  [
    Designed multiple human machine interfaces for HydroFlex, a remote driven internal polishing machine
  ],
  [
    #grid(
      columns: (1fr, 0.9fr),
      [#figure(
          image("portfolio/HydroFlex-HMIPrototype.png", width: 90%),
          caption: "Initial Prototype HMI",
        )
        #figure(
          image("portfolio/HydroFlex-PCB.png", width: 90%),
          caption: "PCB for HMI",
        )],
      [
        - Initial prototype with ESP32 devboard soldered to protoboard.
        - Remote HMI with serial comunication of human input to main control board
        - Stand alone unit designed to interface with MAXON motor controller with integrated 7 segment RPM readout, interface controls, and micro SD card for logging
        - Designed PCB to replace prototype stand alone unit with streamlined integration and additional sensor interfaces
          - Integrated 50V - 3V buck converter
          - eFuse for soft starting motor controller and current monitoring
          - On board seven segement and rotary knob
          - MicroSD card for data logging


      ],
    )
  ],
)

#pagebreak()
#project(
  [Wheel Speed Sensors],
  "",
  [
    Designed analog quadrature hall effect sensors to measure continuious rotation for FSAE electric car
  ],
  [
    #grid(
      columns: (1fr, 1fr),
      [
        - Created custom PCB that communicates analog potential over SPI to a microcontroller
        - Uses two hall effect sensors to measure two analog sin waves from a ring of alternating magnets fixed to the wheel
        - Implemented sensor processing algorithm and filter to calculate rotation speed.
      ],
      figure(image("portfolio/WheelspeedCad.png", width: 90%), caption: "Single wheel speed pcb."),
    )
    #grid(
      columns: (1fr, 1fr),
      figure(
        image("portfolio/SinWaves.png", width: 90%),
        caption: "Raw analog output from hall effect sensors. It is possible to see the phase difference in the sin waves that allows you to tell which direction the wheel is spinning",
      ),
      figure(
        image("portfolio/wheelspeed-telometer.png", width: 90%),
        caption: "Telometer graph of measured rotation speed. There is a lot of noise in the raw measurement but the filtered measuremment is much better",
      ),
    )
    #grid(
      columns: (1fr, 1fr),
      figure(
        image("portfolio/wheelspeed-test.png", width: 90%),
        caption: [Lego test jig with 3d printed magnet ring \ #text(size:7pt)[(The ICs on the right are not doing anything, \ they were just being stored on the breadboard)]],
      ),
      [
        - Created an adjustable lego test bench to hold test magnet ring a fixed distance from the sensor
          - Used to test for optimal magnet distance
          - Processing firmware running on custom IO board which is designed to do sensor comunication on the FSAE car
          - For this test setup communication was done to the computer through an esp32 that is acting as a UART to USB bridge
      ],
    )
  ],
)

#pagebreak()
#project(
  [FSAE Accumulator],
  "",
  [
    Retrofit 403.2V battery pack for a Formula Student Hybrid + Electric race car in just under 8 weeks
  ],
  [
    #figure(
      image("portfolio/NewSegment.png", width: 90%),
      caption: "Single new segment with retrofit copper bus bars and pcb",
    )
    #grid(
      columns: (1fr, 0.9fr),
      figure(
        image("portfolio/AccumulatorAssemble.jpg", height: 4.5cm, width: 90%),
        caption: "Accumulator assembled with single old revision segment in the top left corner",
      ),
      [

        - Designed pcbs to run cell taps and fuses to main bus bars
        - Added strain relief to bus bars in order to improve mechanical reliability of spot welds
        - Improved spot welding process for better speed and reliability:
          - Added nickel strips to each spot weld to dramatically increase spot weld reliability
          - Designed mount for holding probes at a precise distance
          - Removed unnecessary copper to reduce risk of accidentally shorting cell groups while spot welding
          - Used cell tap PCB to cover areas that shoudln't be spot welded.
      ],
    )
    #grid(
      columns: (1fr, 0.8fr, 0.4fr),
      [
        - Designed manufacturing process for copper bus bars to optimize for speed and minimize post processing work
          - Used masking tape and 3M spray adhesive to fixture .127mm copper sheets
          - Routed bus bar cutouts with chamfered engraving bit to minimize burs
          - Designed 3d printed press to form strain relief in the bus bars
        - Tested fusible links for each cell to protect the accumulator in a short circuit
      ],
      figure(image("portfolio/i2t.png", width: 90%), caption: "I2t plot of custom in house fusable links"),
      figure(image("portfolio/FusableLink.png", width: 90%), caption: "Custom copper fusable link design"),
    )
  ],
)

#pagebreak()
#project(
  [Sound Camera],
  "https://github.com/gagnonsilas/sound-camera",
  [
    In Progress: Working on building distributed network of microphones to record and reconstruct 3d audio
  ],
  [
    #grid(
      columns: (1fr, 1fr),
      figure(image("portfolio/SoundCameraPCB.png", width: 90%), caption: "Revision 1 of the sound camera PCB"),
      [
        - Custom PCB for each sensor with onboard STM32, stereo microphones, and a piezoelectric buzzer
        - Multidrop RS485 bus communication in order to allow flexable number of sensors in a network.
        - This project hasn't been finished yet but is under way. Some of the goals for features are:
          - Automated sensor position detection using onboard speaker to triangulate relative position
          - Early detection of mechanical failure using audio analysis of system
          - Dashboard using Telometer to replay and visualize 3d audio files
          - Isolate noises originating from 3d location
      ],
    )
  ],
)
