class Views
  class Products
    class Index < EmbedRuby
      def render
        <<-HTML_RB

          <div class="container">

          <div class="card" style="margin-top: 10px;">
            <div class="card-header text-white bg-danger mb-3">
              Produtos
            </div>
            <div class="card-body">

             <p>
              #{@message}
             </p>

             <p>
              <a href="#{Routes.list[:products][:new][:get][:path]}" class="btn btn-sm btn-primary">
                Novo
              </a>
             </p>

               <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Produto</th>
                    <th scope="col">Preco</th>
                    <th scope="col">Acões</th>
                  </tr>
                </thead>
                <tbody>
                  #{
                @products.map do |product|
                  "
                  <tr>
                    <th>#{product.id}</th>
                    <td>#{product.name}</td>
                    <td>#{product.format_price}</td>
                    <td>#{product.format_price}</td>
                    <td>
                      <button class='btn btn-sm btn-danger' onclick='deleteProduct(#{product.id})'>
                        Apagar
                      </button>
                    </td>
                  </tr>
                  "
                end.join
              }

                </tbody>
              </table>

              </div>
            </div>

          <script>
            function deleteProduct(id) {
              fetch('#{Routes.list[:products][:delete][:delete][:path].gsub(':id','')}' + id, {
                method: 'DELETE'
              })
              .then((response) => {
                window.location.replace('#{Routes.list[:products][:index][:get][:path]}');
              })
            }
          </script>

        HTML_RB
      end
    end
  end
end
