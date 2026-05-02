.class Lfreemarker/ext/servlet/IncludePage$1;
.super Ljavax/servlet/http/HttpServletResponseWrapper;
.source "IncludePage.java"


# instance fields
.field private final this$0:Lfreemarker/ext/servlet/IncludePage;

.field private final val$printWriter:Ljava/io/PrintWriter;


# direct methods
.method constructor <init>(Lfreemarker/ext/servlet/IncludePage;Ljavax/servlet/http/HttpServletResponse;Ljava/io/PrintWriter;)V
    .registers 4
    .param p2, "x0"    # Ljavax/servlet/http/HttpServletResponse;

    .prologue
    .line 92
    invoke-direct {p0, p2}, Ljavax/servlet/http/HttpServletResponseWrapper;-><init>(Ljavax/servlet/http/HttpServletResponse;)V

    iput-object p1, p0, Lfreemarker/ext/servlet/IncludePage$1;->this$0:Lfreemarker/ext/servlet/IncludePage;

    iput-object p3, p0, Lfreemarker/ext/servlet/IncludePage$1;->val$printWriter:Ljava/io/PrintWriter;

    return-void
.end method


# virtual methods
.method public getWriter()Ljava/io/PrintWriter;
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lfreemarker/ext/servlet/IncludePage$1;->val$printWriter:Ljava/io/PrintWriter;

    return-object v0
.end method
