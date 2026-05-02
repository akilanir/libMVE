.class public Lcom/mikepenz/iconics/typeface/GenericFont$Icon;
.super Ljava/lang/Object;
.source "GenericFont.java"

# interfaces
.implements Lcom/mikepenz/iconics/typeface/IIcon;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/iconics/typeface/GenericFont;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Icon"
.end annotation


# instance fields
.field private aChar:C

.field private mName:Ljava/lang/String;

.field private mTypeface:Lcom/mikepenz/iconics/typeface/ITypeface;

.field final synthetic this$0:Lcom/mikepenz/iconics/typeface/GenericFont;


# direct methods
.method public constructor <init>(Lcom/mikepenz/iconics/typeface/GenericFont;C)V
    .registers 3
    .param p1, "this$0"    # Lcom/mikepenz/iconics/typeface/GenericFont;
    .param p2, "c"    # C

    .prologue
    .line 129
    iput-object p1, p0, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;->this$0:Lcom/mikepenz/iconics/typeface/GenericFont;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    iput-char p2, p0, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;->aChar:C

    .line 131
    return-void
.end method

.method public constructor <init>(Lcom/mikepenz/iconics/typeface/GenericFont;Ljava/lang/String;C)V
    .registers 4
    .param p1, "this$0"    # Lcom/mikepenz/iconics/typeface/GenericFont;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "c"    # C

    .prologue
    .line 133
    iput-object p1, p0, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;->this$0:Lcom/mikepenz/iconics/typeface/GenericFont;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    iput-object p2, p0, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;->mName:Ljava/lang/String;

    .line 135
    iput-char p3, p0, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;->aChar:C

    .line 136
    return-void
.end method


# virtual methods
.method public getCharacter()C
    .registers 2

    .prologue
    .line 158
    iget-char v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;->aChar:C

    return v0
.end method

.method public getFormattedName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 145
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 150
    iget-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;->mName:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 151
    iget-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;->mName:Ljava/lang/String;

    .line 153
    :goto_6
    return-object v0

    :cond_7
    iget-char v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;->aChar:C

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public getTypeface()Lcom/mikepenz/iconics/typeface/ITypeface;
    .registers 2

    .prologue
    .line 163
    iget-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;->mTypeface:Lcom/mikepenz/iconics/typeface/ITypeface;

    if-eqz v0, :cond_7

    .line 164
    iget-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;->mTypeface:Lcom/mikepenz/iconics/typeface/ITypeface;

    .line 166
    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;->this$0:Lcom/mikepenz/iconics/typeface/GenericFont;

    goto :goto_6
.end method

.method public withTypeface(Lcom/mikepenz/iconics/typeface/ITypeface;)Lcom/mikepenz/iconics/typeface/GenericFont$Icon;
    .registers 2
    .param p1, "typeface"    # Lcom/mikepenz/iconics/typeface/ITypeface;

    .prologue
    .line 139
    iput-object p1, p0, Lcom/mikepenz/iconics/typeface/GenericFont$Icon;->mTypeface:Lcom/mikepenz/iconics/typeface/ITypeface;

    .line 140
    return-object p0
.end method
