.class Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;
.super Ljava/lang/Object;
.source "BottomSheet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cocosw/bottomsheet/BottomSheet$3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewHolder"
.end annotation


# instance fields
.field private image:Landroid/widget/ImageView;

.field final synthetic this$1:Lcom/cocosw/bottomsheet/BottomSheet$3;

.field private title:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/cocosw/bottomsheet/BottomSheet$3;)V
    .registers 2

    .prologue
    .line 309
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->this$1:Lcom/cocosw/bottomsheet/BottomSheet$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$1500(Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;)Landroid/widget/TextView;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;

    .prologue
    .line 309
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->title:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1502(Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;Landroid/widget/TextView;)Landroid/widget/TextView;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;
    .param p1, "x1"    # Landroid/widget/TextView;

    .prologue
    .line 309
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->title:Landroid/widget/TextView;

    return-object p1
.end method

.method static synthetic access$1600(Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;)Landroid/widget/ImageView;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;

    .prologue
    .line 309
    iget-object v0, p0, Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->image:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$1602(Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;Landroid/widget/ImageView;)Landroid/widget/ImageView;
    .registers 2
    .param p0, "x0"    # Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;
    .param p1, "x1"    # Landroid/widget/ImageView;

    .prologue
    .line 309
    iput-object p1, p0, Lcom/cocosw/bottomsheet/BottomSheet$3$ViewHolder;->image:Landroid/widget/ImageView;

    return-object p1
.end method
