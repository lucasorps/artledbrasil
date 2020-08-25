class Pedido < ActiveRecord::Base


has_many :carrinhos, :dependent => :destroy
has_many :produtos,
    :through => :carrinhos

belongs_to :usuario




  



  
  
  
  
  


  def consultarPedidos()
    
     @listapedidos = Pedido.find(:conditions=>["status=? or data_compra between '?' and '?' or usuario.nome like '?'", 
        params[:status], params[:data_fim], params[:data_fim], params[:nome_cliente]] ) 
    
     respond_to do |format|
      format.html
        format.json { render :json => @listapedidos }
     end 
 
  end
    
  
 
 def finalizarPedidoCartao()
   
   pagamento = Pagamento.new
   pagamento.instituicao
   
 end
 
 def finalizarPedidoBoleto
   
   
   
 end
 

   def exibirProdutoCarrinho()
    
    return @carrinho
       
  end

  def adicionarProdutoCarrinho()
    
    @carrinho << Produto.find_by_id(:params[:id])
    Produto.find_by_id(:params[:id]).quantidade -= 1
       
  end
    
  def excluirProdutoCarrinho(codigoProdutoAExcluir)
    
    @carrinho.delete_if { |a| a.codigo = codigoProdutoAExcluir } 
        
    
  end
    
  def calculaPrecoFinal()
    
    @preco_total = Produto.find_by_id(:params[:id]).preco_unitario * :params[:quantidade].to_i
        
  end


end
