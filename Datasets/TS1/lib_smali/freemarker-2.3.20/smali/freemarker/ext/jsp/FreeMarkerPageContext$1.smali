.class Lfreemarker/ext/jsp/FreeMarkerPageContext$1;
.super Ljavax/servlet/http/HttpServletResponseWrapper;
.source "FreeMarkerPageContext.java"


# instance fields
.field private final this$0:Lfreemarker/ext/jsp/FreeMarkerPageContext;

.field private final val$pw:Ljava/io/PrintWriter;


# direct methods
.method constructor <init>(Lfreemarker/ext/jsp/FreeMarkerPageContext;Ljavax/servlet/http/HttpServletResponse;Ljava/io/PrintWriter;)V
    .registers 4
    .param p2, "x0"    # Ljavax/servlet/http/HttpServletResponse;

    .prologue
    .line 406
    invoke-direct {p0, p2}, Ljavax/servlet/http/HttpServletResponseWrapper;-><init>(Ljavax/servlet/http/HttpServletResponse;)V

    iput-object p1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext$1;->this$0:Lfreemarker/ext/jsp/FreeMarkerPageContext;

    iput-object p3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext$1;->val$pw:Ljava/io/PrintWriter;

    return-void
.end method


# virtual methods
.method public getOutputStream()Ljavax/servlet/ServletOutputStream;
    .registers 3

    .prologue
    .line 412
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "JSP-included resource must use getWriter()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getWriter()Ljava/io/PrintWriter;
    .registers 2

    .prologue
    .line 408
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext$1;->val$pw:Ljava/io/PrintWriter;

    return-object v0
.end method
