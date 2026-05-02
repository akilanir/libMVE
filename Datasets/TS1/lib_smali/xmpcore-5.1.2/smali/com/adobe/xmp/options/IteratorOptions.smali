.class public final Lcom/adobe/xmp/options/IteratorOptions;
.super Lcom/adobe/xmp/options/Options;
.source "IteratorOptions.java"


# static fields
.field public static final JUST_CHILDREN:I = 0x100

.field public static final JUST_LEAFNAME:I = 0x400

.field public static final JUST_LEAFNODES:I = 0x200

.field public static final OMIT_QUALIFIERS:I = 0x1000


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/adobe/xmp/options/Options;-><init>()V

    return-void
.end method


# virtual methods
.method protected defineOptionName(I)Ljava/lang/String;
    .registers 3
    .param p1, "option"    # I

    .prologue
    .line 128
    sparse-switch p1, :sswitch_data_12

    .line 134
    const/4 v0, 0x0

    :goto_4
    return-object v0

    .line 130
    :sswitch_5
    const-string v0, "JUST_CHILDREN"

    goto :goto_4

    .line 131
    :sswitch_8
    const-string v0, "JUST_LEAFNODES"

    goto :goto_4

    .line 132
    :sswitch_b
    const-string v0, "JUST_LEAFNAME"

    goto :goto_4

    .line 133
    :sswitch_e
    const-string v0, "OMIT_QUALIFIERS"

    goto :goto_4

    .line 128
    nop

    :sswitch_data_12
    .sparse-switch
        0x100 -> :sswitch_5
        0x200 -> :sswitch_8
        0x400 -> :sswitch_b
        0x1000 -> :sswitch_e
    .end sparse-switch
.end method

.method protected getValidOptions()I
    .registers 2

    .prologue
    .line 144
    const/16 v0, 0x1700

    return v0
.end method

.method public isJustChildren()Z
    .registers 2

    .prologue
    .line 40
    const/16 v0, 0x100

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/IteratorOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isJustLeafname()Z
    .registers 2

    .prologue
    .line 49
    const/16 v0, 0x400

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/IteratorOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isJustLeafnodes()Z
    .registers 2

    .prologue
    .line 58
    const/16 v0, 0x200

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/IteratorOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isOmitQualifiers()Z
    .registers 2

    .prologue
    .line 67
    const/16 v0, 0x1000

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/IteratorOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public setJustChildren(Z)Lcom/adobe/xmp/options/IteratorOptions;
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 79
    const/16 v0, 0x100

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/options/IteratorOptions;->setOption(IZ)V

    .line 80
    return-object p0
.end method

.method public setJustLeafname(Z)Lcom/adobe/xmp/options/IteratorOptions;
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 92
    const/16 v0, 0x400

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/options/IteratorOptions;->setOption(IZ)V

    .line 93
    return-object p0
.end method

.method public setJustLeafnodes(Z)Lcom/adobe/xmp/options/IteratorOptions;
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 105
    const/16 v0, 0x200

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/options/IteratorOptions;->setOption(IZ)V

    .line 106
    return-object p0
.end method

.method public setOmitQualifiers(Z)Lcom/adobe/xmp/options/IteratorOptions;
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 118
    const/16 v0, 0x1000

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/options/IteratorOptions;->setOption(IZ)V

    .line 119
    return-object p0
.end method
