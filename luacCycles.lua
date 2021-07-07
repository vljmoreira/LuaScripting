-- Lua cycles 


local listaCompras = {
    legumes = {
        cenouras = 1,
        tomate = 1,
        pepino = 1
    }
    fruta = {
        mirtilo = 1,
        cerejas = 2
    }

}
--pairs() retorna value - key a orden n e espelicita
--print (listaCompras)

for k,v in pairs(listaCompras) do
    print(listaCompras[v])
end
    --ipairs() retorna index-value usado para tabelas numericas, tabelas n numericas sao ignoradas