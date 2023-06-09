include("Dislin.jl")

cl1="Item1|Item2|Item3|Item4|Item5"
cfil = " "

Dislin.swgtit("Widgets Example")
ip = Dislin.wgini("VERT")

id = Dislin.wglab(ip, "File Widget:")
id_fil = Dislin.wgfil(ip, "Open File", cfil, "*.c")
id = Dislin.wglab(ip, "List Widget:")
id_lis = Dislin.wglis(ip, cl1, 1)

id = Dislin.wglab(ip, "Button Widgets:")
id_but1 = Dislin.wgbut(ip, "This is Button 1", 0) 
id_but2 = Dislin.wgbut(ip, "This is Button 2", 1)

id = Dislin.wglab(ip, "Scale Widget:")
id_scl = Dislin.wgscl(ip, " ", 0.0, 10.0, 5.0, 1) 
Dislin.wgfin()

cfil = Dislin.gwgfil(id_fil)
ilis = Dislin.gwglis(id_lis)
ib1  = Dislin.gwgbut(id_but1)
ib2  = Dislin.gwgbut(id_but2)
xscl = Dislin.gwgscl(id_scl)

println("File Widget   : ", cfil)
println("Length: ", length(cfil))
println("List Widget   : ", ilis)
println("Button Widgets: ", ib1, ", ", ib2)
println("Scale Widget  : ", xscl)
