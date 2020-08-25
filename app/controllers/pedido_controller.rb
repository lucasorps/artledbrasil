class PedidoController < ApplicationController
  
  
  def atualizartotalprodutopedido
    
   
    @pedido = Pedido.find_by_id(session["ID_PEDIDO"].to_s)  
   
    produto_selecionado = Produto.find_by_id(params[:codigo])
    
    produto_lista_selecionado = @pedido.carrinhos.find_by_produto_id(params[:codigo])   
    
    quantidade_selecionada = params[:quantidade]
    
    if  produto_selecionado.quantidade.to_i < quantidade_selecionada.to_i
      
      
        render :text =>  'Nao ha produtos suficientes'
      
      
      
    else
      
      
      
     novo_valor = quantidade_selecionada.to_i * produto_selecionado.preco_unitario
      
   render :text => "R$ " + "%.02f" % novo_valor.to_s
        
    end 
    
    
    
    
  end
  
  
  def atualizarquantidade()
   
   
    @pedido = Pedido.find_by_id(session["ID_PEDIDO"].to_s)  
   
    produto_selecionado = Produto.find_by_id(params[:codigo])
    
    produto_lista_selecionado = @pedido.carrinhos.find_by_produto_id(params[:codigo])   
    
    quantidade_selecionada = params[:quantidade]
    
    if  produto_selecionado.quantidade.to_i < quantidade_selecionada.to_i
      
      
      puts 'NAO HA PRODUTOS SUFICIENTE'
      
      
    else
      
      valor_retirar = (produto_lista_selecionado.quantidade.to_i * produto_selecionado.preco_unitario)
      puts valor_retirar.to_s
      @pedido.preco_total -= valor_retirar
      puts @pedido.preco_total.to_s
      produto_lista_selecionado.quantidade = quantidade_selecionada
      @pedido.preco_total += (produto_lista_selecionado.quantidade * produto_selecionado.preco_unitario)
      puts @pedido.preco_total.to_s
      produto_lista_selecionado.save
      @pedido.save
      
      
        
    end 
    
    
   render :text => "R$ " + "%.02f" % @pedido.preco_total.to_s
    
  end
  
  def detalharusuario
    
    
   @detalhes_usuario = Usuario.find_by_id(params[:id])
   
   dados = "<div class='col-sm-7'><div class='product-information'><p><b>Nome Completo:</b>" + @detalhes_usuario.nome + "</p>" +
    "<p><b>Sexo:</b>" + @detalhes_usuario.sexo + "</p><p><b>CPF:</b>" + @detalhes_usuario.cpf + "</p>" +                       
     "<p><b>Logradouro:</b>" + @detalhes_usuario.logradouro + "</p><p><b>Data de Cadastro:</b>" + @detalhes_usuario.cpf + "</p>" +
     "<p><b>Telefone Residencial:</b>" + @detalhes_usuario.telefone_residencial + "</p>" +
     "<p><b>Telefone Celular:</b>" + @detalhes_usuario.telefone_celular + "</p>" +
     "<p><b>E-Mail:</b>" + @detalhes_usuario.email + "</p></div></div>"
    
    
    
   render :text => dados 

  end
  
  def detalharpedido
    
    
   @detalhes_pedido = Pedido.find_by_id(params[:id])
   @detalhes_carrinho = Carrinho.find_all_by_pedido_id(params[:id])
    
    dados = "<table class='table'><thead><tr class='cart_menu'><td class=''>Nome do Produto</td><td class=''>Quantidade</td><td class=''>Preco Unitario</td>" 
                      
                 
    dados +=   "</tr></thead><tbody>"  
                    for p in @detalhes_carrinho 
                
    dados +=            "<tr><td class=''>" + p.produto.nome + "</td>" 
    dados +=                         "<td class=''>" + p.produto.quantidade.to_s + "</td>" 
    dados +=                         "<td class=''> R$ " + "%.02f" % p.produto.preco_unitario.to_s + "</td></tr>" 
                                      end 
    dados +=                         "</tbody></table><div class='col-sm-7'><div class='product-information'>"                                              
    dados +=                         "<p><b> Total da Compra: </b> R$ " + "%.02f" % @detalhes_pedido.preco_total.to_s + "</p>" 
    dados +=                         "<p><b>Forma de Pagamento: </b> " + @detalhes_pedido.datacompra.strftime("%d/%m/%Y") + "</p>" 
    dados +=                         "<p><b>Data de Compra: </b> " + @detalhes_pedido.datacompra.strftime("%d/%m/%Y") + "</p>"                       
    dados +=                         "<p><b>Data de Pagamento: </b> " + @detalhes_pedido.datapagamento.strftime("%d/%m/%Y") + "</p>" 
    dados +=                         "<p><b>Data de Entrega: </b> " + @detalhes_pedido.dataentrega.strftime("%d/%m/%Y") + "</p></div></div>"

    
    
    
   render :text => dados
    
    
    
  end
  
  def incluirprodutocarrinho()
    
    #O produto comprado é buscado na base */
    produto_comprado = Produto.find_by_id(params[:id])
    
    
    if session["ID_PEDIDO"].nil? #nil -> null
    
      @pedido = Pedido.new
      @pedido.preco_total = produto_comprado.preco_unitario
      @pedido.save        
      session["ID_PEDIDO"] = @pedido.id
      @pedido.carrinhos.create(:produto => produto_comprado, :quantidade => params[:quantidade].to_i)
           
    else
    
      @pedido = Pedido.find_by_id(session["ID_PEDIDO"].to_s)  
      
      
      carrinho = @pedido.carrinhos.find_by_produto_id(produto_comprado.id) 
      
       if carrinho.nil?
          @pedido.carrinhos.create(:produto => produto_comprado, :quantidade => params[:quantidade].to_i) 
       else
          carrinho.quantidade +=1
          carrinho.save
       end
       
      @pedido.preco_total += produto_comprado.preco_unitario
      @pedido.save        
    
    end
        
    redirect_to :controller => 'produto', :action => 'cadastro'
    
    
  end

  def calcularPrecoFinalPedido(produto_comprado)
      
      preco_final += produto_comprado.preco_unitario * @pedido.carrinho.quantidade
      return preco_final 
  
  end 



  
  def exibircarrinho
          
          
      pedido_usuario = Pedido.find_by_id(session["ID_PEDIDO"].to_s)
  
      

      dados = "  <div class='table-responsive cart_info'><table class='table table-condensed'>" +
                      "<thead>" +
                        "<tr class='cart_menu'>" +
                          "<td class='image'>Item</td>" +
                          "<td class='description'></td>" +
                          "<td class='price'>Quantidade</td>" +
                          "<td class='quantity'>Preco</td>" +
                          "<td class='total'>Total</td>" +
                          "<td class='delete'></td>" +
                        "</tr>" +
                      "</thead>" +
                        "<tbody>"
    
     if session["ID_PEDIDO"].nil?
      #puts "ID PEDIDO " + session[:pedido].to_s 
      
       dados = " <tr><td ><p class='caixa_logado'><i class='fa fa-times'></i> Nao ha produtos disponiveis no carrinho</p></td></tr></table></div>"                                 
           
       
     else
  
      
      pedido_usuario.produtos.each do |p| 
      
      dados += "<tr class='item'>"
      dados += "<td class='item_pedido'>" + view_context.image_tag(p.imagem.url, size: "60x100") + "</td>" 
      
                       
      dados +=                "<td class='cart_description'>"
      dados +=                 "<h4>"+ p.nome + "</h4>"
      dados +=                        "<p>Codigo:<span class='codigo_produto'>" + p.id.to_s + "</span></p>"
      dados +=                        "</td>"
      dados +=                       "<td class='cart_quantity'>"
      dados +=                         "<div class='cart_quantity_button'>"
      dados +=                           "<a class='cart_quantity_up'>+</a>"
      dados +=                           "<input class='cart_quantity_input' type='text' name='quantity' value='" + pedido_usuario.carrinhos.find_by_produto_id(p.id).quantidade.to_s + "' autocomplete='off' size='2'>"
      dados +=                           "<a class='cart_quantity_down'>-</a>"
      dados +=                         "</div>"
      dados +=                       "</td>"
                              
      dados +=                      "<td class='cart_price'>"
      dados +=                        "<p class='cart_item_price'>R$ " + "%.02f" % p.preco_unitario.to_s + "</p>"
      dados +=                      "</td>"
      dados +=                      "<td class='cart_item_total'>"
      dados +=                        "<p class='cart_item_total_price'>R$ " + "%.02f" % (p.preco_unitario *  pedido_usuario.carrinhos.find_by_produto_id(p.id).quantidade).to_s  + "</p>"
      dados +=                      "</td>"
      dados +=              "<td class='cart_delete'>"
      dados +=              (view_context.link_to '<i class="fa fa-times"></i>'.html_safe, {:controller => 'pedido', :action => 'excluirprodutocarrinho', :id => p.id}, class: 'cart_quantity_delete') 

      dados +=             "</td></tr>"
            
            end
      
      dados +=            "<tr class='cart_menu'><td class='image'>Preco Final</td>"
      dados +=             " <td class='description'></td>"
      dados +=              "<td class='price'></td>"
      dados +=              "<td class='quantity'></td>"
      dados +=              "<td class='cart_total'>R$ " + "%.02f" % pedido_usuario.preco_total.to_s + "</td>"
      dados +=              "<td></td> "
      dados +=            "</tr>"
      dados +=          "</tbody>"


      dados +=            "<tfoot><tr>"
      dados +=              "<td ></td>"
      dados +=              "<td ></td>"
      dados +=              "<td ></td>"
      dados +=              "<td ></td>"
      dados +=              "<td >" + (view_context.link_to 'Finalizar Pedido', {:controller => 'pagamento', :action => 'finalizar'}, class: 'btn btn-primary pull-right ', id: 'botaofinaliza') + "</td>"
      dados +=                      "<td></td>"
      dados +=                    "</tr>"
      dados +=          "</tfoot>"
      dados +=          "</table></div>"                                 
      
    end
   render :text => dados 


  end
  
  
  def excluirprodutocarrinho()
    
    pedido_usuario = Pedido.find_by_id(session["ID_PEDIDO"].to_s)
    
    quantidade = pedido_usuario.carrinhos.find_by_produto_id(params[:id])
    
    pedido_usuario.carrinhos.find_by_produto_id(params[:id]).destroy
    
    pedido_usuario.preco_total -= (quantidade.quantidade * Produto.find_by_id(params[:id]).preco_unitario) 
    
    pedido_usuario.save
    
     redirect_to :controller => 'produto', :action => 'cadastro'
    
  end
  
  def detalharcarrinho
    
    
   @detalhes_pedido = Pedido.find_by_id_(:params[id_pedido])
   @detalhes_carrinho = Carrinho.find_by_id_pedido(:params[id_pedido])
    
    respond_to do |format|

      format.html
      format.json { render :json => @detalhes_pedido }
      format.json { render :json => @detalhes_carrinho }
     end
       
  end
  
  def consulta
    
    @consulta = Pedido.new
    @desabilitar_pesquisa = true
    
  end
  
  

  def consultarpedido
    
    
    @desabilitar_pesquisa = true
    #nome_cliente = Cliente.find_by_nome(params[:nome]).cpf # usar cpf 
    
    if params[:data_inicio].empty? and params[:data_fim].empty?
      @lista_pedido = Pedido.where("status = :stt ", stt: params[:status])
    else
      @lista_pedido = Pedido.where("status = :stt AND (created_at >= :start_date AND created_at <= :end_date)", 
      stt: params[:status], start_date: params[:data_inicio], end_date: params[:data_fim])
    end
    
    if !params[:cpf].empty?
      @lista_pedido = @lista_pedido.find_all_by_cpf(params[:cpf])
    end 
    
    render :controller => "pedido", :action => "consulta"
        
  end
  
  
  def finalizar()
    
    if session["USUARIO"].nil? #nil -> null
      redirect_to :controller => "login", :action => "login"
    else
    
      
      
      if (params[:tipo] = 'B')
        finalizarPedidoBoleto()
      end
      if (params[:tipo] = 'C')
        finalizarPedidoCartao()
      end
  
      pedido_salvo = Pedido.find_by_id(session["USUARIO"][:id_pedido])
      pedido_salvo.datacompra = DateTime.now
  
  
    end
  
  end
  
  
    private

  def produto_params
    params.require(:pedido).permit(
:usuario_id,
:preco_total,
:status,
:datacompra,
:dataentrega,
:datapagamento,

)
  end

  
  

end 