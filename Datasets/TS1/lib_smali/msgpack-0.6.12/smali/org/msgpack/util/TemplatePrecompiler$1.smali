.class final Lorg/msgpack/util/TemplatePrecompiler$1;
.super Ljava/util/HashSet;
.source "TemplatePrecompiler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/msgpack/util/TemplatePrecompiler;->matchClassNames(Ljava/util/List;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashSet",
        "<",
        "Ljavax/tools/JavaFileObject$Kind;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    .line 82
    sget-object v0, Ljavax/tools/JavaFileObject$Kind;->CLASS:Ljavax/tools/JavaFileObject$Kind;

    invoke-virtual {p0, v0}, Lorg/msgpack/util/TemplatePrecompiler$1;->add(Ljava/lang/Object;)Z

    .line 83
    return-void
.end method
