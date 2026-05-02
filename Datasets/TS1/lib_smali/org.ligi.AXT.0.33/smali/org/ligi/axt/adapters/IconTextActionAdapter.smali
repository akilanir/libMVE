.class public Lorg/ligi/axt/adapters/IconTextActionAdapter;
.super Landroid/widget/BaseAdapter;
.source "IconTextActionAdapter.java"


# instance fields
.field private actions:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private containerResId:I

.field private imageResId:I

.field private images:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private labels:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private textResId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    const/4 v1, -0x1

    .line 59
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 39
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->actions:Ljava/util/Vector;

    .line 40
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->images:Ljava/util/Vector;

    .line 41
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->labels:Ljava/util/Vector;

    .line 43
    iput v1, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->containerResId:I

    .line 44
    iput v1, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->textResId:I

    .line 45
    iput v1, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->imageResId:I

    .line 60
    iput-object p1, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->mContext:Landroid/content/Context;

    .line 61
    return-void
.end method


# virtual methods
.method public add(IILjava/lang/Integer;)V
    .registers 6
    .param p1, "actionid"    # I
    .param p2, "img_resid"    # I
    .param p3, "label_resid"    # Ljava/lang/Integer;

    .prologue
    .line 48
    iget-object v0, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->actions:Ljava/util/Vector;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 49
    iget-object v0, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->images:Ljava/util/Vector;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 50
    iget-object v0, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->labels:Ljava/util/Vector;

    invoke-virtual {v0, p3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 51
    return-void
.end method

.method public getAction(I)I
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 68
    iget-object v0, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->actions:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->images:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 72
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 76
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 14
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v9, -0x1

    .line 81
    iget v8, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->containerResId:I

    if-eq v8, v9, :cond_45

    .line 82
    iget-object v8, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->mContext:Landroid/content/Context;

    const-string v9, "layout_inflater"

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/LayoutInflater;

    .line 84
    .local v7, "vi":Landroid/view/LayoutInflater;
    iget v8, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->containerResId:I

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 85
    .local v5, "row":Landroid/view/View;
    iget v8, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->textResId:I

    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 86
    .local v2, "label":Landroid/widget/TextView;
    iget-object v8, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->labels:Ljava/util/Vector;

    invoke-virtual {v8, p1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setText(I)V

    .line 88
    iget v8, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->imageResId:I

    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 89
    .local v1, "img":Landroid/widget/ImageView;
    iget-object v8, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->images:Ljava/util/Vector;

    invoke-virtual {v8, p1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v1, v8}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 109
    .end local v1    # "img":Landroid/widget/ImageView;
    .end local v2    # "label":Landroid/widget/TextView;
    .end local v5    # "row":Landroid/view/View;
    .end local v7    # "vi":Landroid/view/LayoutInflater;
    :goto_44
    return-object v5

    .line 94
    :cond_45
    new-instance v3, Landroid/widget/LinearLayout;

    iget-object v8, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v3, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 95
    .local v3, "lin":Landroid/widget/LinearLayout;
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x2

    invoke-direct {v4, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 97
    .local v4, "lp":Landroid/widget/LinearLayout$LayoutParams;
    const/4 v8, 0x0

    invoke-virtual {v3, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 99
    new-instance v0, Landroid/widget/ImageView;

    iget-object v8, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v8}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 100
    .local v0, "i":Landroid/widget/ImageView;
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    iget-object v8, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->images:Ljava/util/Vector;

    invoke-virtual {v8, p1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 102
    sget-object v8, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 103
    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 104
    new-instance v6, Landroid/widget/TextView;

    iget-object v8, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v6, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 105
    .local v6, "tv":Landroid/widget/TextView;
    iget-object v8, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->labels:Ljava/util/Vector;

    invoke-virtual {v8, p1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(I)V

    .line 106
    const/4 v8, 0x5

    const/high16 v9, 0x41a00000    # 20.0f

    invoke-virtual {v6, v8, v9}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 107
    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    move-object v5, v3

    .line 109
    goto :goto_44
.end method

.method public style(III)V
    .registers 4
    .param p1, "containerResId"    # I
    .param p2, "textResId"    # I
    .param p3, "imageResId"    # I

    .prologue
    .line 54
    iput p1, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->containerResId:I

    .line 55
    iput p2, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->textResId:I

    .line 56
    iput p3, p0, Lorg/ligi/axt/adapters/IconTextActionAdapter;->imageResId:I

    .line 57
    return-void
.end method
