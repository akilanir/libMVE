.class Lorg/apache/commons/compress/archivers/sevenz/Coders$BCJDecoder$1;
.super Ljava/io/FilterOutputStream;
.source "Coders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/commons/compress/archivers/sevenz/Coders$BCJDecoder;->encode(Ljava/io/OutputStream;Ljava/lang/Object;)Ljava/io/OutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/compress/archivers/sevenz/Coders$BCJDecoder;


# direct methods
.method constructor <init>(Lorg/apache/commons/compress/archivers/sevenz/Coders$BCJDecoder;Ljava/io/OutputStream;)V
    .registers 3
    .param p2, "x0"    # Ljava/io/OutputStream;

    .prologue
    .line 140
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/sevenz/Coders$BCJDecoder$1;->this$0:Lorg/apache/commons/compress/archivers/sevenz/Coders$BCJDecoder;

    invoke-direct {p0, p2}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    return-void
.end method


# virtual methods
.method public flush()V
    .registers 1

    .prologue
    .line 143
    return-void
.end method
