# scad-libraries

Meta-repo to maintain (external) OpenSCAD libraries

## install and use

Can introduce into a design repo as `git submodule`:

```shell
git submodule add https://github.com/idcrook/scad-libraries.git libraries
git submodule update --init --recursive
```

Then within a `.scad` file (located in a peer directory), could use something like:

```
use <../libraries/dotSCAD/src/rounded_square.scad>
```

## See Also

- https://github.com/openscad/openscad/wiki/Libraries
- https://www.thingiverse.com/openscad/collections/libraries


### Creation

```shell
git submodule add https://github.com/idcrook/MCAD.git
##git submodule add https://github.com/idcrook/BOLTS.git
##git rm BOLTS && ...commit...
##cd .. && rm -rf  .git/modules/libraries/modules/BOLTS
git submodule add https://github.com/idcrook/boltsparts.git bolts
git submodule add https://github.com/idcrook/BOSL2.git
git submodule add https://github.com/idcrook/Chamfers-for-OpenSCAD.git
git submodule add https://github.com/idcrook/NopSCADlib.git
git submodule add https://github.com/idcrook/agentscad.git
git submodule add https://github.com/idcrook/dotSCAD.git
git submodule add https://github.com/idcrook/relativity.scad.git
git submodule add https://github.com/idcrook/nutsnbolts.git
git submodule add https://github.com/idcrook/scad-utils.git
git submodule add https://github.com/KitWallace/openscad.git kitwallace__openscad
git submodule add https://github.com/idcrook/list-comprehension-demos.git
git submodule add https://github.com/idcrook/scadqr.git
git submodule add https://github.com/idcrook/UB.scad.git
mkdir scad-misc/
touch scad-misc/README.md
git add scad-misc/README.md
( cd MCAD  && git remote add upstream https://github.com/openscad/MCAD.git )
##( cd BOLTS && git remote add upstream https://github.com/boltsparts/BOLTS.git )
( cd bolts && git remote add upstream https://github.com/boltsparts/boltsparts.git )
( cd BOSL2 && git remote add upstream https://github.com/revarbat/BOSL2.git )
( cd Chamfers-for-OpenSCAD && git remote add upstream https://github.com/SebiTimeWaster/Chamfers-for-OpenSCAD.git )
( cd NopSCADlib && git remote add upstream https://github.com/nophead/NopSCADlib.git )
( cd agentscad && git remote add upstream https://github.com/GillesBouissac/agentscad.git )
( cd dotSCAD && git remote add upstream https://github.com/JustinSDK/dotSCAD.git )
( cd scad-utils && git remote add upstream https://github.com/openscad/scad-utils.git )
( cd scadqr && git remote add upstream https://github.com/xypwn/scadqr.git)
( cd UB.scad && git remote add upstream https://github.com/UBaer21/UB.scad.git)
```


# BOLTS

<https://github.com/boltsparts/boltsparts>

BOLTS is an Open Library for Technical Specifications.

# BOSL2

<https://github.com/revarbat/BOSL2/wiki>

**The Belfry OpenScad Library, v2**

A library for OpenSCAD, filled with useful tools, shapes, masks, math and manipulators, designed to make OpenSCAD easier to use.

# Chamfers-for-OpenSCAD

<https://github.com/SebiTimeWaster/Chamfers-for-OpenSCAD>

Chamfered primitives for OpenSCAD

A library to create primitives with 45° chamfers in OpenSCAD.

# MCAD

MCAD is a library of useful functions for the OpenSCAD 3D modeling software. Comes bundled with OpenSCAD application.


# NopSCADlib

<https://github.com/nophead/NopSCADlib>

# agentscad

<https://github.com/GillesBouissac/agentscad>

My utilities for OpenSCAD

#### Prerequisites

[Follow these instructions to use the library](https://github.com/GillesBouissac/agentscad/wiki/Prerequisites)

# dotSCAD

<https://github.com/JustinSDK/dotSCAD>

<https://openhome.cc/eGossip/OpenSCAD/>

Reduce the burden of mathematics when playing OpenSCAD.

# kitwallace__openscad

<https://github.com/KitWallace/openscad>

OpenSCAD scripts

# list-comprehension-demos

https://github.com/openscad/list-comprehension-demos

This repository contains some demos made possible by the addition of list comprehension to OpenSCAD. In particular it contains a user-space sweep() module which can be used to sweep a 2D shape along a 3D path.

# misc

- `fillet.scad`
- `2dWedge.scad`
- `wedge.scad`

# scad-utils

<https://github.com/openscad/scad-utils>

Utility libraries for OpenSCAD


# relativity

<https://github.com/davidson16807/relativity.scad>

The OpenSCAD General Library of Relativity

This library adds functionality to size, position, and orient objects relative to other geometric primitives.
The library introduces a new set of modules to replace the default geometric primitives in OpenSCAD.

# nutsnbolts

<https://github.com/JohK/nutsnbolts>

A OpenSCAD library that allows for simple creation of nuts and bolts and respective nut catches and screw holes.


# scadqr

<https://github.com/idcrook/scadqr/tree/main/#scadqr>

Effortlessly generate QR codes directly in OpenSCAD! No extra dependencies!
