.class abstract Lezvcard/Ezvcard$WriterChain;
.super Ljava/lang/Object;
.source "Ezvcard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/Ezvcard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "WriterChain"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final this_:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field final vcards:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lezvcard/VCard;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Collection;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lezvcard/VCard;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1330
    .local p0, "this":Lezvcard/Ezvcard$WriterChain;, "Lezvcard/Ezvcard$WriterChain<TT;>;"
    .local p1, "vcards":Ljava/util/Collection;, "Ljava/util/Collection<Lezvcard/VCard;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1327
    iput-object p0, p0, Lezvcard/Ezvcard$WriterChain;->this_:Ljava/lang/Object;

    .line 1331
    iput-object p1, p0, Lezvcard/Ezvcard$WriterChain;->vcards:Ljava/util/Collection;

    .line 1332
    return-void
.end method
