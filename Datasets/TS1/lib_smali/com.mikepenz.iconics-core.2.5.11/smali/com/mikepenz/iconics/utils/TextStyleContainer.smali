.class public Lcom/mikepenz/iconics/utils/TextStyleContainer;
.super Ljava/lang/Object;
.source "TextStyleContainer.java"


# instance fields
.field public spannableStringBuilder:Landroid/text/SpannableStringBuilder;

.field public styleContainers:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/mikepenz/iconics/utils/StyleContainer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/text/SpannableStringBuilder;Ljava/util/LinkedList;)V
    .registers 3
    .param p1, "spannableStringBuilder"    # Landroid/text/SpannableStringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/text/SpannableStringBuilder;",
            "Ljava/util/LinkedList",
            "<",
            "Lcom/mikepenz/iconics/utils/StyleContainer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 11
    .local p2, "styleContainers":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/mikepenz/iconics/utils/StyleContainer;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/mikepenz/iconics/utils/TextStyleContainer;->spannableStringBuilder:Landroid/text/SpannableStringBuilder;

    .line 13
    iput-object p2, p0, Lcom/mikepenz/iconics/utils/TextStyleContainer;->styleContainers:Ljava/util/LinkedList;

    .line 14
    return-void
.end method
