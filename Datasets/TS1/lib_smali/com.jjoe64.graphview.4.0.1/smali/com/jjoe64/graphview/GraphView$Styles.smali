.class final Lcom/jjoe64/graphview/GraphView$Styles;
.super Ljava/lang/Object;
.source "GraphView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jjoe64/graphview/GraphView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Styles"
.end annotation


# instance fields
.field titleColor:I

.field titleTextSize:F


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/jjoe64/graphview/GraphView$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/jjoe64/graphview/GraphView$1;

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/jjoe64/graphview/GraphView$Styles;-><init>()V

    return-void
.end method
