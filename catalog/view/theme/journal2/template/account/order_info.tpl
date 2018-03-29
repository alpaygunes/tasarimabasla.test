<?php echo $header; ?>
<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
      <h1 class="heading-title"><?php echo $heading_title; ?></h1>
      <?php echo $content_top; ?>
      <table class="table table-bordered table-hover list">
        <thead>
          <tr>
            <td class="text-left" colspan="2"><?php echo $text_order_detail; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left" style="width: 50%;"><?php if ($invoice_no) { ?>
              <b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br />
              <?php } ?>
              <b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
              <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
            <td class="text-left"><?php if ($payment_method) { ?>
              <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
              <?php } ?>
              <?php if ($shipping_method) { ?>
              <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
              <?php } ?></td>
          </tr>
        </tbody>
      </table>
      <table class="table table-bordered table-hover list">
        <thead>
          <tr>
            <td class="text-left" style="width: 50%;"><?php echo $text_payment_address; ?></td>
            <?php if ($shipping_address) { ?>
            <td class="text-left"><?php echo $text_shipping_address; ?></td>
            <?php } ?>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left"><?php echo $payment_address; ?></td>
            <?php if ($shipping_address) { ?>
            <td class="text-left"><?php echo $shipping_address; ?></td>
            <?php } ?>
          </tr>
        </tbody>
      </table>
      <div class="table-responsive">
        <table class="table table-bordered table-hover list">
          <thead>
            <tr>
              <td class="text-left"><?php echo $column_name; ?></td>
              <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-right"><?php echo $column_quantity; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
              <?php if ($products) { ?>
              <td style="width: 20px;"></td>
              <?php } ?>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td class="text-left"><?php echo $product['name']; ?>
                <?php foreach ($product['option'] as $option) { ?>
                <br />
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } ?>
                <!------------------------- alpaygunes -->
                <br>
                <div class="btn btn-primary tasarimi-goster" return_url="<?php echo $product['return']?>" onizleme_url="<?php echo $product['onizleme_url'];?>"
                     style="
                          padding: 5px;
                          width: 40px;
                          height: 30px;
                          border: 1px solid #ccc;
                          background-color: #00A8FF">
                  <i style="font-size: 25px;" class="fa fa-eye"></i>
                </div>

              </td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-right"><?php echo $product['quantity']; ?></td>
              <td class="text-right"><?php echo $product['price']; ?></td>
              <td class="text-right"><?php echo $product['total']; ?></td>
              <td class="text-right" style="white-space: nowrap;"><?php if ($product['reorder']) { ?>
                <a href="<?php echo $product['reorder']; ?>" data-toggle="tooltip" title="<?php echo $button_reorder; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i></a>
                <?php } ?>
                <a href="<?php echo $product['return']; ?>" data-toggle="tooltip" title="<?php echo $button_return; ?>" class="btn btn-danger"><i class="fa fa-reply"></i></a></td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
              <td class="text-left"><?php echo $voucher['description']; ?></td>
              <td class="text-left"></td>
              <td class="text-right">1</td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <?php if ($products) { ?>
              <td></td>
              <?php } ?>
            </tr>
            <?php } ?>
          </tbody>
          <tfoot>
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td colspan="3"></td>
              <td class="text-right"><b><?php echo $total['title']; ?></b></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
              <?php if ($products) { ?>
              <td></td>
              <?php } ?>
            </tr>
            <?php } ?>
          </tfoot>
        </table>
      </div>
      <?php if ($comment) { ?>
      <table class="table table-bordered table-hover list">
        <thead>
          <tr>
            <td class="text-left"><?php echo $text_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left"><?php echo $comment; ?></td>
          </tr>
        </tbody>
      </table>
      <?php } ?>
      <?php if ($histories) { ?>
      <h3><?php echo $text_history; ?></h3>
      <div class="table-responsive">
        <table class="table table-bordered table-hover list">
          <thead>
          <tr>
            <td class="text-left"><?php echo $column_date_added; ?></td>
            <td class="text-left"><?php echo $column_status; ?></td>
            <td class="text-left"><?php echo $column_comment; ?></td>
          </tr>
          </thead>
          <tbody>
          <?php foreach ($histories as $history) { ?>
          <tr>
            <td class="text-left"><?php echo $history['date_added']; ?></td>
            <td class="text-left"><?php echo $history['status']; ?></td>
            <td class="text-left"><?php echo $history['comment']; ?></td>
          </tr>
          <?php } ?>
          </tbody>
        </table>
      </div>
      <?php } ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary button"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    </div>
</div>


<div class="modal fade" tabindex="-1" role="dialog" id="onizleme-modal" aria-labelledby="gridSystemModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width: 90%; max-width: 450px;min-height: 300px">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">TASARIMINIZ BU ŞEKİLDE</h4>
      </div>

      <div id="loader" style="display: none;
                              width: 200px;
                              height: 150px;
                              top:30%;
                              left: 25%;
                              z-index: 99;
                              position: absolute">
        <div style="    margin-top: 0px;
                              margin-left: 22px;
                              width: 150px;
                              height: 150px;
                              text-align: center;
                              background-color: #fff;
                              border-radius: 100px;
                              position: absolute;
                              padding-top: 60px;"
        >İşlem devam <br> ediyor</div>
        <i class="fa fa-spinner fa-pulse fa-5x fa-fw"
           style="
                     font-size: 150px!important;
                     position: absolute">
        </i>
      </div>


      <div class="modal-body" id="onilzeme-body">
        <br><br><br><br><br><br><br><br>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Kapat</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<?php echo $footer; ?>

<script language="JavaScript">
    var sayac= 0;
    window.onload=function () {
        sayac++;
        $('.tasarimi-goster').eq(0).trigger('click');
    }

    $(document).ready(function () {

        $('.tasarimi-goster').click(function () {
            var onizleme_url = $(this).attr('onizleme_url');
            onizleme_url = onizleme_url.replace(/&amp;/g, '&');
            $('#loader').show();
            $('#onilzeme-body').empty();
            var obj = $(this);
            $.ajax({
                type: "POST",
                url: onizleme_url,
                success: function(msg) {
                    if(msg!=null){
                        var iceriklerArr = JSON.parse(msg);
                        if(iceriklerArr.length){
                            if(sayac>1){
                                $('#onizleme-modal').modal('show');
                            }else{
                                sayac++;
                                //fontların yüklenmesinde sorun var o nedenle tetiklemek sayfa dışına div oluşturalım
                                fontTetikleyici(iceriklerArr)
                            }
                            console.log(iceriklerArr);
                            resmiDerle(iceriklerArr);
                        }else{
                            //window.location.href = obj.attr("orjinal_adres");
                            alert("Bu ürüne ait tasarım yok . ")
                        }
                    }else{
                        $('#onizleme-modal').modal('hide');
                        //window.location.href = obj.attr("orjinal_adres");
                        //alert("Bu ürüne ait tasarım yok.")
                        $(tiklanan).hide();
                    }

                },
                error: function(msg) {

                    //window.location.href = obj.attr("orjinal_adres");
                }
            });

        })
    })

    function fontTetikleyici(iceriklerArr) {
        for (var k in iceriklerArr) {
            if (iceriklerArr.hasOwnProperty(k)) {
                icerik              = iceriklerArr[k];
                if(icerik.bicim == 'duz'){
                    fontBoyuntunuHesapla(icerik);
                }else{
                    daireselYaziIcinfontBoyuntunuHesapla(icerik);
                }
            }
        }
    }

    function resmiDerle(iceriklerArr){
        $('#onilzeme-body').empty();
        $('#onilzeme-body').append(canvasRender(iceriklerArr,$('#onilzeme-body').width(),$('#onilzeme-body').height()));
        $('#loader').hide();

        $('#onilzeme-body').find('canvas').css('width','95%')
    }

</script>