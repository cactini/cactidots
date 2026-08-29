--
-- Animations
--

-- Curves
hl.curve("easeOutBack", {type = "bezier", points = { {0.34, 1.56}, {0.64, 1}}})
hl.curve("sideDown", {type = "bezier", points = { {0.3, 1}, {0.7, 1}}})
hl.curve("ease", {type = "bezier", points = { {0.25, 0.1}, {0.25, 1.0}}})
hl.curve("easeOutQuint", {type = "bezier", points = { {0.23, 1}, {0.32, 1}}})
hl.curve("easeInOutCubic", {type = "bezier", points = { {0.65, 0.05}, {0.36, 1}}})
hl.curve("linear", {type = "bezier", points = { {0, 0}, {1, 1}}})
hl.curve("almostLinear", {type = "bezier", points = { {0.5, 0.5}, {0.75, 1.0}}})
hl.curve("quick", {type = "bezier", points = { {0.15, 0}, {0.1, 1}}})

-- Window animations
hl.animation({leaf = "windowsIn", enabled = true, speed = 2.5, bezier = "easeOutBack", style = "popin 90%"})
hl.animation({leaf = "windowsIn", enabled = true, speed = 2.5, bezier = "easeOutQuint", style = "slide"})
hl.animation({leaf = "windowsOut", enabled = true, speed = 2.5, bezier ="sideDown", style = "slide"})
hl.animation({leaf = "windows", enabled = true, speed = 5.0, bezier = "easeOutQuint"})

-- Fade animations
hl.animation({leaf = "fadeIn", enabled = true, speed = 2.0, bezier = "almostLinear"})
hl.animation({leaf = "fadeOut", enabled = true, speed = 1.8, bezier = "almostLinear"})
hl.animation({leaf = "fade", enabled = true, speed = 2.8, bezier = "quick"})

-- Layer animations
hl.animation({leaf = "layers",        enabled = true, speed = 4, bezier = "ease", style = "slidefade"})
hl.animation({leaf = "layersOut",     enabled = true, speed = 4, bezier = "ease", style = "slidefade"})

-- Workspace animations
hl.animation({leaf = "workspaces", enabled = true, speed = 2.0, bezier = "easeInOutCubic", style = "slide"})
hl.animation({leaf = "workspacesIn", enabled = true, speed = 3.0, bezier = "easeInOutCubic", style = "slide"})
hl.animation({leaf = "workspacesOut", enabled = true, speed = 3.0, bezier = "easeInOutCubic", style = "slide"})

-- idk chat
hl.animation({leaf = "fade", enabled = true, speed = 8, bezier = "ease"})
