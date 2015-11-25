<%@page language="java"  pageEncoding="utf-8" %><%--
--%><%@page contentType="text/html; charset=utf-8" %><%--
--%><!DOCTYPE html>
<html lang="ja">
 <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <title>ほげ</title>
  <link rel="stylesheet" href="css/main.css">
 </head>
 <body>
  <div id="upload">
   <input type="button" id="uploadButton" value="ファイルを選択">
   <input type="file" id="file" multiple="multiple" style="display: none;">
   <div class="uploadInfo"></div>
  </div>
  <script src="js/lib/jquery-2.1.4.min.js"></script>
  <script src="js/jquery.file-upload.js"></script>
  <script>
(function($) {
  $('#upload').fileUpload({
    progressCallBack: function() {
      var loadedSize = this.loadedSize;
      var fileSize = this.fileSize;

      this.$fileName.text(this.fileName);
      this.$transferSize.text(this.getDispFileSize(loadedSize) + ' / ' +
                              this.getDispFileSize(fileSize));

      var barWidth = this.$progressBar.width() ? this.$progressBar.width() : 1;
      var progressStatus = loadedSize / fileSize;
      if (progressStatus === 1) {
        this.$transferStatus.text('アップロード完了');
        this.$stopButton.hide();
        this.$deleteButton.show();
      } else {
        var borderLeftWidth = Math.floor(progressStatus * barWidth);
        this.$progressBar.css('border-left-width', borderLeftWidth + 'px');
      }
    },
    failCallBack: function() {
      this.$transferStatus.text('エラー');
    },
    stopCallBack: function() {
      if (this.ajax) {
        this.ajax.abort();
      }
      this.$stopButton.hide();
    }
  });
})(jQuery);
  </script>
 </body>
</html>