.class public Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;
.super Ljava/lang/Object;
.source "NavigationDrawerDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/drawable/NavigationDrawerDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mLineDrawable:Lcom/rey/material/drawable/LineMorphingDrawable;

.field private mRippleDrawable:Lcom/rey/material/drawable/ToolbarRippleDrawable;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "defStyleRes"    # I

    .prologue
    .line 112
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 113
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v5, 0x0

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    sget-object v4, Lcom/rey/material/R$styleable;->NavigationDrawerDrawable:[I

    invoke-virtual {p1, p2, v4, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 118
    .local v0, "a":Landroid/content/res/TypedArray;
    if-eqz v0, :cond_37

    .line 119
    sget v4, Lcom/rey/material/R$styleable;->NavigationDrawerDrawable_nd_ripple:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    .line 120
    .local v3, "rippleId":I
    sget v4, Lcom/rey/material/R$styleable;->NavigationDrawerDrawable_nd_icon:I

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 122
    .local v2, "lineId":I
    if-lez v3, :cond_26

    .line 123
    new-instance v4, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;

    invoke-direct {v4, p1, v3}, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v4}, Lcom/rey/material/drawable/ToolbarRippleDrawable$Builder;->build()Lcom/rey/material/drawable/ToolbarRippleDrawable;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;->ripple(Lcom/rey/material/drawable/ToolbarRippleDrawable;)Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;

    .line 125
    :cond_26
    if-lez v2, :cond_34

    .line 126
    new-instance v1, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;

    invoke-direct {v1, p1, v2}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;-><init>(Landroid/content/Context;I)V

    .line 127
    .local v1, "builder":Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    invoke-virtual {v1}, Lcom/rey/material/drawable/LineMorphingDrawable$Builder;->build()Lcom/rey/material/drawable/LineMorphingDrawable;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;->line(Lcom/rey/material/drawable/LineMorphingDrawable;)Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;

    .line 130
    .end local v1    # "builder":Lcom/rey/material/drawable/LineMorphingDrawable$Builder;
    :cond_34
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 132
    .end local v2    # "lineId":I
    .end local v3    # "rippleId":I
    :cond_37
    return-void
.end method


# virtual methods
.method public build()Lcom/rey/material/drawable/NavigationDrawerDrawable;
    .registers 4

    .prologue
    .line 135
    new-instance v0, Lcom/rey/material/drawable/NavigationDrawerDrawable;

    iget-object v1, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;->mRippleDrawable:Lcom/rey/material/drawable/ToolbarRippleDrawable;

    iget-object v2, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;->mLineDrawable:Lcom/rey/material/drawable/LineMorphingDrawable;

    invoke-direct {v0, v1, v2}, Lcom/rey/material/drawable/NavigationDrawerDrawable;-><init>(Lcom/rey/material/drawable/ToolbarRippleDrawable;Lcom/rey/material/drawable/LineMorphingDrawable;)V

    return-object v0
.end method

.method public line(Lcom/rey/material/drawable/LineMorphingDrawable;)Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;
    .registers 2
    .param p1, "drawable"    # Lcom/rey/material/drawable/LineMorphingDrawable;

    .prologue
    .line 145
    iput-object p1, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;->mLineDrawable:Lcom/rey/material/drawable/LineMorphingDrawable;

    .line 147
    return-object p0
.end method

.method public ripple(Lcom/rey/material/drawable/ToolbarRippleDrawable;)Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;
    .registers 2
    .param p1, "drawable"    # Lcom/rey/material/drawable/ToolbarRippleDrawable;

    .prologue
    .line 139
    iput-object p1, p0, Lcom/rey/material/drawable/NavigationDrawerDrawable$Builder;->mRippleDrawable:Lcom/rey/material/drawable/ToolbarRippleDrawable;

    .line 141
    return-object p0
.end method
