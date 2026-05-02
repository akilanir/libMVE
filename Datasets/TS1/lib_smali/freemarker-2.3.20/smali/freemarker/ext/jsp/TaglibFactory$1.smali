.class Lfreemarker/ext/jsp/TaglibFactory$1;
.super Ljava/io/FilterInputStream;
.source "TaglibFactory.java"


# instance fields
.field private final this$0:Lfreemarker/ext/jsp/TaglibFactory;


# direct methods
.method constructor <init>(Lfreemarker/ext/jsp/TaglibFactory;Ljava/io/InputStream;)V
    .registers 3
    .param p2, "x0"    # Ljava/io/InputStream;

    .prologue
    .line 379
    invoke-direct {p0, p2}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object p1, p0, Lfreemarker/ext/jsp/TaglibFactory$1;->this$0:Lfreemarker/ext/jsp/TaglibFactory;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 381
    return-void
.end method
