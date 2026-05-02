.class public final Lcom/adobe/xmp/options/AliasOptions;
.super Lcom/adobe/xmp/options/Options;
.source "AliasOptions.java"


# static fields
.field public static final PROP_ARRAY:I = 0x200

.field public static final PROP_ARRAY_ALTERNATE:I = 0x800

.field public static final PROP_ARRAY_ALT_TEXT:I = 0x1000

.field public static final PROP_ARRAY_ORDERED:I = 0x400

.field public static final PROP_DIRECT:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/adobe/xmp/options/Options;-><init>()V

    .line 42
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/adobe/xmp/options/Options;-><init>(I)V

    .line 52
    return-void
.end method


# virtual methods
.method protected defineOptionName(I)Ljava/lang/String;
    .registers 3
    .param p1, "option"    # I

    .prologue
    .line 160
    sparse-switch p1, :sswitch_data_14

    .line 167
    const/4 v0, 0x0

    :goto_4
    return-object v0

    .line 162
    :sswitch_5
    const-string v0, "PROP_DIRECT"

    goto :goto_4

    .line 163
    :sswitch_8
    const-string v0, "ARRAY"

    goto :goto_4

    .line 164
    :sswitch_b
    const-string v0, "ARRAY_ORDERED"

    goto :goto_4

    .line 165
    :sswitch_e
    const-string v0, "ARRAY_ALTERNATE"

    goto :goto_4

    .line 166
    :sswitch_11
    const-string v0, "ARRAY_ALT_TEXT"

    goto :goto_4

    .line 160
    :sswitch_data_14
    .sparse-switch
        0x0 -> :sswitch_5
        0x200 -> :sswitch_8
        0x400 -> :sswitch_b
        0x800 -> :sswitch_e
        0x1000 -> :sswitch_11
    .end sparse-switch
.end method

.method protected getValidOptions()I
    .registers 2

    .prologue
    .line 177
    const/16 v0, 0x1e00

    return v0
.end method

.method public isArray()Z
    .registers 2

    .prologue
    .line 69
    const/16 v0, 0x200

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/AliasOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isArrayAltText()Z
    .registers 2

    .prologue
    .line 129
    const/16 v0, 0x1000

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/AliasOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isArrayAlternate()Z
    .registers 2

    .prologue
    .line 109
    const/16 v0, 0x800

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/AliasOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isArrayOrdered()Z
    .registers 2

    .prologue
    .line 89
    const/16 v0, 0x400

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/AliasOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public isSimple()Z
    .registers 2

    .prologue
    .line 60
    invoke-virtual {p0}, Lcom/adobe/xmp/options/AliasOptions;->getOptions()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setArray(Z)Lcom/adobe/xmp/options/AliasOptions;
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 79
    const/16 v0, 0x200

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/options/AliasOptions;->setOption(IZ)V

    .line 80
    return-object p0
.end method

.method public setArrayAltText(Z)Lcom/adobe/xmp/options/AliasOptions;
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 139
    const/16 v0, 0x1e00

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/options/AliasOptions;->setOption(IZ)V

    .line 141
    return-object p0
.end method

.method public setArrayAlternate(Z)Lcom/adobe/xmp/options/AliasOptions;
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 119
    const/16 v0, 0xe00

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/options/AliasOptions;->setOption(IZ)V

    .line 120
    return-object p0
.end method

.method public setArrayOrdered(Z)Lcom/adobe/xmp/options/AliasOptions;
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 99
    const/16 v0, 0x600

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/options/AliasOptions;->setOption(IZ)V

    .line 100
    return-object p0
.end method

.method public toPropertyOptions()Lcom/adobe/xmp/options/PropertyOptions;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 151
    new-instance v0, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-virtual {p0}, Lcom/adobe/xmp/options/AliasOptions;->getOptions()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/adobe/xmp/options/PropertyOptions;-><init>(I)V

    return-object v0
.end method
