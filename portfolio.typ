
// #let name = ""

#let title = [Silas Gagnon]

#set document(title: title, author: "Silas Gagnon", date: auto)

// #set page(margin: 1cm);

// #show grid: set pad(1cm)

#let project(name, github, description, content, show-item: true) = {
  [
    #pad(
      bottom: -0.2cm,
      top: 0.1cm,
      [
        #heading(name, level: 2)
        #text(fill:color.blue)[#link(github)]\
        #description
      ],
    )
    #content
  ]
}

#set text(
  font: "Charis SIL",
  size: 9.5pt,
)

#let section(title) = {
  [
    #heading(title, level: 1)
    #line(length: 5cm, stroke: color.teal)
  ]
}


#section[Projects]
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
        image("portfolio/CarPlot.png", width: 90%),
        caption: "Plot of WPI Goat Fast racing electric car acceleration test run",
      ),
      [
        - Capable of doing realtime data synchronization over any serial communication protocol (UART, CAN, UDP, Bluetooth, etc)
        - Implemented to send values directly as binary with only 2 bytes of overhead per packet
        - Used in many other projects for live visualization and tuning
          - Robotics courses with differential embedded robots and 6 degree of freedom arms
          - WPI Goat Fast Racing electric car live tuning and plotting
          - Used by another WPI student for a combat robot: Danger Doughnut #link( "https://github.com/gavin4d/dangerDoughnut")
        - Implemented the front end dashboard in zig using DearImGui with live 2d and 3d plots and visualizations
        - Packaged with the Nix package manager
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
      figure(image("portfolio/wheelspeed-test.png", width: 90%), caption: "Single wheel speed pcb."),
      [\ \ \ \
        - Created a lego test bench to hold test magnet ring a fixed distance from the sensor
        - Communicating to the computer through an esp32 that is acting as a UART bridge to a custom IO board which is designed to do sensor comunication on the FSAE car
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
      image("portfolio/NewSegment.png", width: 95%),
      caption: "Single new segment with retrofit copper bus bars and pcb",
    )
    #grid(
      columns: (1fr, 0.8fr),
      figure(
        image("portfolio/AccumulatorAssemble.jpg", width: 90%),
        caption: "Accumulator assembled with single old revision segment in the top left corner",
      ),
      [

        - Designed pcbs to run cell taps and fuses to main bus bars
        - Added strain relief to bus bars in order to improve mechanical reliability of spot welds
        - Improved spot welding process for better speed and reliability:
          - Added nickel strips to each spot weld to dramatically increase spot weld reliability
          - Designed mount for holding probes at a precise distance
          - Removed unessacary copper to reduce risk of accidentally shorting cell groups while spot welding
        - Routed copper bus bars in house with an engraving bit to minimize post processing work
      ],
    )
    #grid(
      columns: (1fr, 0.8fr, 0.4fr),
      [
        \ \ \ \ \ \
        - Manufactured and tested fusible links for each cell to protect the accumulator in a short circuit
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
      figure(image("portfolio/SoundCameraPCB.png", width:90%), caption: "Revision 1 of the sound camera PCB"),
      [
        - Custom PCB for each sensor with onboard STM32, stereo microphones, and a piezoelectric buzzer
        - CAN bus communication in order to allow flexable number of sensors in a network.
        - This project hasn't been finished yet but is under way. Some of the goals for features are:
          - Automated sensor position detection using onboard speaker to triangulate relative position
          - Early detection of mechanical failure using audio analysis of system
          - Dashboard using Telometer to replay and visualize 3d audio files
          - Isolate noises originating from 3d location
      ],
    )
  ],
)
