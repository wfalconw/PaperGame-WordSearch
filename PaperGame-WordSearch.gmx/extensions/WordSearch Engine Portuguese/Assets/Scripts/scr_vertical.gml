///scr_vertical()

var word_orig = word;

if(irandom(99) <= chance)
{
    word = reverseString(word);
}
else
{
    reversed = 0;
}

if(word_length <= board_h)
{
    var xx, yy, letra_atual, letra_num;
    
    xx = irandom(ds_grid_width(board) - 1);
    yy = irandom(ds_grid_height(board) - 1);
    
    //Primeira letra
    letra_num = 1;
    letra_atual = string_char_at(word, letra_num);
    
    for(i = 0; i <= word_length; i++)
    {
        //Se o numero da letra for menor do que a palavra a ser colocada
        if(letra_num <= word_length)
        {
            if(ds_grid_get(board, xx, yy + i) == letra_atual)
            {
                letra_num += 1;
                letra_atual = string_char_at(word, letra_num);
            }
            else
            {
                if(ds_grid_get(board, xx, yy + i) == 0)
                {
                    letra_num += 1;
                    letra_atual = string_char_at(word, letra_num);
                }
                else
                {
                    exit;
                }
            }
        }
        else
        {
            //DEPOIS DA VERIFICAÇÃO, COMEÇA A ADIDIONAR A PALAVRA
            letra_num = 1;
            letra_atual = string_char_at(word, letra_num);
            
            //COMEÇA A REPETIÇÃO PARA ADICIONAR AS LETRAS
            for(add = 0; add < word_length; add++)
            {
                //ADD VALOR ATIVO
                cell_id += 1;
                
                ds_map_replace(map_cell[xx, yy + add], "id", cell_id);
                
                ativo = ds_map_find_value(map_cell[xx, yy + add], "ativo");
                
                ativo += 1;
                
                ds_map_replace(map_cell[xx, yy + add], "ativo", ativo);
                //FIM VALOR ATIVO
                
                if(add == 0)
                {
                    ds_map_add(map_cell[xx, yy + add], "word_" + string(ativo), word);
                    ds_map_replace(map_cell[xx, yy + add], "first", 1);
                    
                    if(reversed == 1)
                    {
                        ds_map_replace(map_cell[xx, yy + add], "reversed", 1);
                    }
                }
                else
                {
                    if(add == (word_length - 1))
                    {
                        ds_map_add(map_cell[xx, yy + add], "word_" + string(ativo), word);
                        ds_map_replace(map_cell[xx, yy + add], "last", 1);
                        
                        ds_list_add(words_to_find, word_orig);
                        ds_list_sort(words_to_find, 1);
                        
                        size_words_to_find = ds_list_size(words_to_find);
                        
                        ds_map_add(map_lista, "palavra_" + string(word_orig), word_orig);
                        ds_map_add(map_lista, "cor_" + string(word_orig), list_font_color);
                        
                        if(reversed == 1)
                        {
                            ds_map_replace(map_cell[xx, yy + add], "reversed", 1);
                        }
                    }
                }
                
                ds_grid_set(board, xx, yy + add, letra_atual);
                
                letra_num += 1;
                letra_atual = string_char_at(word, letra_num);
            }
            
            //Deleta a palavra da lista
            ds_list_delete(words, 0);
            letra_num = 1;
        }
    }
}
else
{
    //Deleta a palavra da lista
    ds_list_delete(words, 0);
}
