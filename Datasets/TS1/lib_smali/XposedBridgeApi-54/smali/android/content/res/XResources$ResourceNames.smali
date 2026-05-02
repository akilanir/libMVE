.class public Landroid/content/res/XResources$ResourceNames;
.super Ljava/lang/Object;
.source "XResources.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/content/res/XResources;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ResourceNames"
.end annotation


# instance fields
.field public final fullName:Ljava/lang/String;

.field public final id:I

.field public final name:Ljava/lang/String;

.field public final pkg:Ljava/lang/String;

.field public final type:Ljava/lang/String;


# direct methods
.method private constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "id"    # I
    .param p2, "pkg"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "type"    # Ljava/lang/String;

    .prologue
    .line 239
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 240
    iput p1, p0, Landroid/content/res/XResources$ResourceNames;->id:I

    .line 241
    iput-object p2, p0, Landroid/content/res/XResources$ResourceNames;->pkg:Ljava/lang/String;

    .line 242
    iput-object p3, p0, Landroid/content/res/XResources$ResourceNames;->name:Ljava/lang/String;

    .line 243
    iput-object p4, p0, Landroid/content/res/XResources$ResourceNames;->type:Ljava/lang/String;

    .line 244
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/content/res/XResources$ResourceNames;->fullName:Ljava/lang/String;

    .line 245
    return-void
.end method

.method synthetic constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/res/XResources$ResourceNames;)V
    .registers 6

    .prologue
    .line 239
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/content/res/XResources$ResourceNames;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Z
    .registers 6
    .param p1, "pkg"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;
    .param p4, "id"    # I

    .prologue
    .line 251
    if-eqz p1, :cond_a

    iget-object v0, p0, Landroid/content/res/XResources$ResourceNames;->pkg:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 252
    :cond_a
    if-eqz p2, :cond_14

    iget-object v0, p0, Landroid/content/res/XResources$ResourceNames;->name:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 253
    :cond_14
    if-eqz p3, :cond_1e

    iget-object v0, p0, Landroid/content/res/XResources$ResourceNames;->type:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 254
    :cond_1e
    if-eqz p4, :cond_24

    iget v0, p0, Landroid/content/res/XResources$ResourceNames;->id:I

    if-ne p4, v0, :cond_26

    .line 251
    :cond_24
    const/4 v0, 0x1

    :goto_25
    return v0

    :cond_26
    const/4 v0, 0x0

    goto :goto_25
.end method
