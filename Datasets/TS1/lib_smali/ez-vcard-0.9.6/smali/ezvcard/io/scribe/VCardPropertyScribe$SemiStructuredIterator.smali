.class public Lezvcard/io/scribe/VCardPropertyScribe$SemiStructuredIterator;
.super Ljava/lang/Object;
.source "VCardPropertyScribe.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/io/scribe/VCardPropertyScribe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "SemiStructuredIterator"
.end annotation


# instance fields
.field private final it:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Iterator;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 973
    .local p1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 974
    iput-object p1, p0, Lezvcard/io/scribe/VCardPropertyScribe$SemiStructuredIterator;->it:Ljava/util/Iterator;

    .line 975
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2

    .prologue
    .line 986
    iget-object v0, p0, Lezvcard/io/scribe/VCardPropertyScribe$SemiStructuredIterator;->it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/String;
    .registers 2

    .prologue
    .line 982
    invoke-virtual {p0}, Lezvcard/io/scribe/VCardPropertyScribe$SemiStructuredIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Lezvcard/io/scribe/VCardPropertyScribe$SemiStructuredIterator;->it:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method
