.class public Lcom/mikepenz/iconics/IconicsArrayBuilder;
.super Ljava/lang/Object;
.source "IconicsArrayBuilder.java"


# instance fields
.field private mIconBase:Lcom/mikepenz/iconics/IconicsDrawable;

.field private mIcons:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/mikepenz/iconics/IconicsDrawable;)V
    .registers 3
    .param p1, "iconicsDrawable"    # Lcom/mikepenz/iconics/IconicsDrawable;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/iconics/IconicsArrayBuilder;->mIcons:Ljava/util/ArrayList;

    .line 15
    iput-object p1, p0, Lcom/mikepenz/iconics/IconicsArrayBuilder;->mIconBase:Lcom/mikepenz/iconics/IconicsDrawable;

    .line 16
    return-void
.end method


# virtual methods
.method public add(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsArrayBuilder;
    .registers 3
    .param p1, "icon"    # Lcom/mikepenz/iconics/typeface/IIcon;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsArrayBuilder;->mIcons:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    return-object p0
.end method

.method public add(Ljava/lang/Character;)Lcom/mikepenz/iconics/IconicsArrayBuilder;
    .registers 3
    .param p1, "icon"    # Ljava/lang/Character;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsArrayBuilder;->mIcons:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    return-object p0
.end method

.method public add(Ljava/lang/String;)Lcom/mikepenz/iconics/IconicsArrayBuilder;
    .registers 3
    .param p1, "icon"    # Ljava/lang/String;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/mikepenz/iconics/IconicsArrayBuilder;->mIcons:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    return-object p0
.end method

.method public build()[Lcom/mikepenz/iconics/IconicsDrawable;
    .registers 5

    .prologue
    .line 34
    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsArrayBuilder;->mIcons:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v1, v2, [Lcom/mikepenz/iconics/IconicsDrawable;

    .line 36
    .local v1, "iconicsDrawables":[Lcom/mikepenz/iconics/IconicsDrawable;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsArrayBuilder;->mIcons:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_70

    .line 37
    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsArrayBuilder;->mIcons:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lcom/mikepenz/iconics/typeface/IIcon;

    if-eqz v2, :cond_32

    .line 38
    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsArrayBuilder;->mIconBase:Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v2}, Lcom/mikepenz/iconics/IconicsDrawable;->clone()Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v3

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsArrayBuilder;->mIcons:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mikepenz/iconics/typeface/IIcon;

    invoke-virtual {v3, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Lcom/mikepenz/iconics/typeface/IIcon;)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v2

    aput-object v2, v1, v0

    .line 36
    :cond_2f
    :goto_2f
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 39
    :cond_32
    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsArrayBuilder;->mIcons:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/Character;

    if-eqz v2, :cond_51

    .line 40
    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsArrayBuilder;->mIconBase:Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v2}, Lcom/mikepenz/iconics/IconicsDrawable;->clone()Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v3

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsArrayBuilder;->mIcons:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Character;

    invoke-virtual {v3, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->icon(Ljava/lang/Character;)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v2

    aput-object v2, v1, v0

    goto :goto_2f

    .line 41
    :cond_51
    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsArrayBuilder;->mIcons:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/String;

    if-eqz v2, :cond_2f

    .line 42
    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsArrayBuilder;->mIconBase:Lcom/mikepenz/iconics/IconicsDrawable;

    invoke-virtual {v2}, Lcom/mikepenz/iconics/IconicsDrawable;->clone()Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v3

    iget-object v2, p0, Lcom/mikepenz/iconics/IconicsArrayBuilder;->mIcons:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Lcom/mikepenz/iconics/IconicsDrawable;->iconText(Ljava/lang/String;)Lcom/mikepenz/iconics/IconicsDrawable;

    move-result-object v2

    aput-object v2, v1, v0

    goto :goto_2f

    .line 46
    :cond_70
    return-object v1
.end method
