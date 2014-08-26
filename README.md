Mash
====

Mash, 2D Game Engine with [Ash](http://www.ashframework.org/) Entity System Framework

[![Build Status](https://travis-ci.org/Rahazan/Mash.svg?branch=master)](https://travis-ci.org/Rahazan/Mash) [![Stories in Ready](https://badge.waffle.io/Rahazan/Mash.png?label=ready&title=Ready)](https://waffle.io/Rahazan/Mash)
====
Planned features:

**Editor**

Editor à la Unity Editor, but much simpler. Entity Component System approach should make this pretty straightforward.

Tech for this editor
atom-shell, with javascript compiled from Haxe. Allows me to benefit from anything a modern browser can do for GUI.

**Scripting**

Logic of games written in Haxe.

**Engine**

Built upon [Kha](https://github.com/KTXSoftware/Kha), to allow for targeting everything from html5 to your toaster. Also, no pesky flash imitation.

====
Why?

I think ECS-based architectures are really awesome. Hopefully making a tool like this will allow for rapid prototyping, and a gentle introduction to non-Unity-like ECS (with logic in systems, not the components). 

Since the entities and components are just data, maybe those who did not write the logic can compose levels easily and mix and match components, disabling and enabling systems at wish.

====

Expectation: This project will need some time.
