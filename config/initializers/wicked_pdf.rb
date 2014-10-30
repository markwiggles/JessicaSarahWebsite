WickedPdf.config = {
  #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
  #:layout => "pdf.html",
  :exe_path => '/Users/mark/.rbenv/shims/wkhtmltopdf'

}

Mime::Type.register "application/pdf", :pdf
