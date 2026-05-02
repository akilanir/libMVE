.class public Landroid/support/v7/widget/GridLayout$Spec;
.super Ljava/lang/Object;
.source "GridLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/GridLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Spec"
.end annotation


# static fields
.field static final UNDEFINED:Landroid/support/v7/widget/GridLayout$Spec;


# instance fields
.field final alignment:Landroid/support/v7/widget/GridLayout$Alignment;

.field final span:Landroid/support/v7/widget/GridLayout$Interval;

.field final startDefined:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 2279
    const/high16 v0, -0x80000000

    invoke-static {v0}, Landroid/support/v7/widget/GridLayout;->spec(I)Landroid/support/v7/widget/GridLayout$Spec;

    move-result-object v0

    sput-object v0, Landroid/support/v7/widget/GridLayout$Spec;->UNDEFINED:Landroid/support/v7/widget/GridLayout$Spec;

    return-void
.end method

.method private constructor <init>(ZIILandroid/support/v7/widget/GridLayout$Alignment;)V
    .registers 7
    .param p1, "startDefined"    # Z
    .param p2, "start"    # I
    .param p3, "size"    # I
    .param p4, "alignment"    # Landroid/support/v7/widget/GridLayout$Alignment;

    .prologue
    .line 2292
    new-instance v0, Landroid/support/v7/widget/GridLayout$Interval;

    add-int v1, p2, p3

    invoke-direct {v0, p2, v1}, Landroid/support/v7/widget/GridLayout$Interval;-><init>(II)V

    invoke-direct {p0, p1, v0, p4}, Landroid/support/v7/widget/GridLayout$Spec;-><init>(ZLandroid/support/v7/widget/GridLayout$Interval;Landroid/support/v7/widget/GridLayout$Alignment;)V

    .line 2293
    return-void
.end method

.method synthetic constructor <init>(ZIILandroid/support/v7/widget/GridLayout$Alignment;Landroid/support/v7/widget/GridLayout$1;)V
    .registers 6
    .param p1, "x0"    # Z
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # Landroid/support/v7/widget/GridLayout$Alignment;
    .param p5, "x4"    # Landroid/support/v7/widget/GridLayout$1;

    .prologue
    .line 2278
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v7/widget/GridLayout$Spec;-><init>(ZIILandroid/support/v7/widget/GridLayout$Alignment;)V

    return-void
.end method

.method private constructor <init>(ZLandroid/support/v7/widget/GridLayout$Interval;Landroid/support/v7/widget/GridLayout$Alignment;)V
    .registers 4
    .param p1, "startDefined"    # Z
    .param p2, "span"    # Landroid/support/v7/widget/GridLayout$Interval;
    .param p3, "alignment"    # Landroid/support/v7/widget/GridLayout$Alignment;

    .prologue
    .line 2285
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2286
    iput-boolean p1, p0, Landroid/support/v7/widget/GridLayout$Spec;->startDefined:Z

    .line 2287
    iput-object p2, p0, Landroid/support/v7/widget/GridLayout$Spec;->span:Landroid/support/v7/widget/GridLayout$Interval;

    .line 2288
    iput-object p3, p0, Landroid/support/v7/widget/GridLayout$Spec;->alignment:Landroid/support/v7/widget/GridLayout$Alignment;

    .line 2289
    return-void
.end method


# virtual methods
.method final copyWriteAlignment(Landroid/support/v7/widget/GridLayout$Alignment;)Landroid/support/v7/widget/GridLayout$Spec;
    .registers 5
    .param p1, "alignment"    # Landroid/support/v7/widget/GridLayout$Alignment;

    .prologue
    .line 2300
    new-instance v0, Landroid/support/v7/widget/GridLayout$Spec;

    iget-boolean v1, p0, Landroid/support/v7/widget/GridLayout$Spec;->startDefined:Z

    iget-object v2, p0, Landroid/support/v7/widget/GridLayout$Spec;->span:Landroid/support/v7/widget/GridLayout$Interval;

    invoke-direct {v0, v1, v2, p1}, Landroid/support/v7/widget/GridLayout$Spec;-><init>(ZLandroid/support/v7/widget/GridLayout$Interval;Landroid/support/v7/widget/GridLayout$Alignment;)V

    return-object v0
.end method

.method final copyWriteSpan(Landroid/support/v7/widget/GridLayout$Interval;)Landroid/support/v7/widget/GridLayout$Spec;
    .registers 5
    .param p1, "span"    # Landroid/support/v7/widget/GridLayout$Interval;

    .prologue
    .line 2296
    new-instance v0, Landroid/support/v7/widget/GridLayout$Spec;

    iget-boolean v1, p0, Landroid/support/v7/widget/GridLayout$Spec;->startDefined:Z

    iget-object v2, p0, Landroid/support/v7/widget/GridLayout$Spec;->alignment:Landroid/support/v7/widget/GridLayout$Alignment;

    invoke-direct {v0, v1, p1, v2}, Landroid/support/v7/widget/GridLayout$Spec;-><init>(ZLandroid/support/v7/widget/GridLayout$Interval;Landroid/support/v7/widget/GridLayout$Alignment;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "that"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 2319
    if-ne p0, p1, :cond_5

    .line 2336
    :cond_4
    :goto_4
    return v1

    .line 2322
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    .line 2323
    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 2326
    check-cast v0, Landroid/support/v7/widget/GridLayout$Spec;

    .line 2328
    .local v0, "spec":Landroid/support/v7/widget/GridLayout$Spec;
    iget-object v3, p0, Landroid/support/v7/widget/GridLayout$Spec;->alignment:Landroid/support/v7/widget/GridLayout$Alignment;

    iget-object v4, v0, Landroid/support/v7/widget/GridLayout$Spec;->alignment:Landroid/support/v7/widget/GridLayout$Alignment;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_22

    move v1, v2

    .line 2329
    goto :goto_4

    .line 2332
    :cond_22
    iget-object v3, p0, Landroid/support/v7/widget/GridLayout$Spec;->span:Landroid/support/v7/widget/GridLayout$Interval;

    iget-object v4, v0, Landroid/support/v7/widget/GridLayout$Spec;->span:Landroid/support/v7/widget/GridLayout$Interval;

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/GridLayout$Interval;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 2333
    goto :goto_4
.end method

.method final getFlexibility()I
    .registers 3

    .prologue
    .line 2304
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$Spec;->alignment:Landroid/support/v7/widget/GridLayout$Alignment;

    sget-object v1, Landroid/support/v7/widget/GridLayout;->UNDEFINED_ALIGNMENT:Landroid/support/v7/widget/GridLayout$Alignment;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x0

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x2

    goto :goto_7
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 2341
    iget-object v1, p0, Landroid/support/v7/widget/GridLayout$Spec;->span:Landroid/support/v7/widget/GridLayout$Interval;

    invoke-virtual {v1}, Landroid/support/v7/widget/GridLayout$Interval;->hashCode()I

    move-result v0

    .line 2342
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Landroid/support/v7/widget/GridLayout$Spec;->alignment:Landroid/support/v7/widget/GridLayout$Alignment;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 2343
    return v0
.end method
