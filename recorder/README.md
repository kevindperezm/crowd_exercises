# Recorder
An exercise at Crowd Interactive.

## Description
We must build a Recorder class that can record methods to be played against an object.

Example of recording methods:

    recorder = Recorder.new

    > recorder.reverse!
    => reverse! has been recorded

    > recorder.downcase!
    => downcase! has been recorded

    > recorder.insert 2, 'ABBA'
    => insert! has been recorded

    > recorder.delete! 'A'
    => delete! has been recorded

To play our recording we should execute a method playback which receive an object as parameter

    > x = 'Hola Mundo'
    => 'Hola Mundo'

    > recorder.playback x
    => Executed actions [:reverse!, downcase!, insert!, delete!]

    > x
    => "dlBBroW olleH"

## Authors
Kevin Perez [kevin.perez@crowint.com](mailto:kevin.perez@crowdint.com)
