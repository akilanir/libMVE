.class public Lcom/bea/xml/stream/util/ElementTypeNames;
.super Ljava/lang/Object;
.source "ElementTypeNames.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getEventType(Ljava/lang/String;)I
    .registers 2
    .param p0, "val"    # Ljava/lang/String;

    .prologue
    .line 54
    const-string v0, "START_ELEMENT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 55
    const/4 v0, 0x1

    .line 78
    :goto_9
    return v0

    .line 56
    :cond_a
    const-string v0, "SPACE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 57
    const/4 v0, 0x6

    goto :goto_9

    .line 58
    :cond_14
    const-string v0, "END_ELEMENT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 59
    const/4 v0, 0x2

    goto :goto_9

    .line 60
    :cond_1e
    const-string v0, "PROCESSING_INSTRUCTION"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 61
    const/4 v0, 0x3

    goto :goto_9

    .line 62
    :cond_28
    const-string v0, "CHARACTERS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    .line 63
    const/4 v0, 0x4

    goto :goto_9

    .line 64
    :cond_32
    const-string v0, "COMMENT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 65
    const/4 v0, 0x5

    goto :goto_9

    .line 66
    :cond_3c
    const-string v0, "START_DOCUMENT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    .line 67
    const/4 v0, 0x7

    goto :goto_9

    .line 68
    :cond_46
    const-string v0, "END_DOCUMENT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_51

    .line 69
    const/16 v0, 0x8

    goto :goto_9

    .line 70
    :cond_51
    const-string v0, "ATTRIBUTE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5c

    .line 71
    const/16 v0, 0xa

    goto :goto_9

    .line 72
    :cond_5c
    const-string v0, "DTD"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_67

    .line 73
    const/16 v0, 0xb

    goto :goto_9

    .line 74
    :cond_67
    const-string v0, "CDATA"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_72

    .line 75
    const/16 v0, 0xc

    goto :goto_9

    .line 76
    :cond_72
    const-string v0, "NAMESPACE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7d

    .line 77
    const/16 v0, 0xd

    goto :goto_9

    .line 78
    :cond_7d
    const/4 v0, -0x1

    goto :goto_9
.end method

.method public static final getEventTypeString(I)Ljava/lang/String;
    .registers 2
    .param p0, "eventType"    # I

    .prologue
    .line 22
    packed-switch p0, :pswitch_data_2e

    .line 50
    const-string v0, "UNKNOWN_EVENT_TYPE"

    :goto_5
    return-object v0

    .line 24
    :pswitch_6
    const-string v0, "START_ELEMENT"

    goto :goto_5

    .line 26
    :pswitch_9
    const-string v0, "END_ELEMENT"

    goto :goto_5

    .line 28
    :pswitch_c
    const-string v0, "PROCESSING_INSTRUCTION"

    goto :goto_5

    .line 30
    :pswitch_f
    const-string v0, "CHARACTERS"

    goto :goto_5

    .line 32
    :pswitch_12
    const-string v0, "SPACE"

    goto :goto_5

    .line 34
    :pswitch_15
    const-string v0, "COMMENT"

    goto :goto_5

    .line 36
    :pswitch_18
    const-string v0, "START_DOCUMENT"

    goto :goto_5

    .line 38
    :pswitch_1b
    const-string v0, "END_DOCUMENT"

    goto :goto_5

    .line 40
    :pswitch_1e
    const-string v0, "ENTITY_REFERENCE"

    goto :goto_5

    .line 42
    :pswitch_21
    const-string v0, "ATTRIBUTE"

    goto :goto_5

    .line 44
    :pswitch_24
    const-string v0, "DTD"

    goto :goto_5

    .line 46
    :pswitch_27
    const-string v0, "CDATA"

    goto :goto_5

    .line 48
    :pswitch_2a
    const-string v0, "NAMESPACE"

    goto :goto_5

    .line 22
    nop

    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_6
        :pswitch_9
        :pswitch_c
        :pswitch_f
        :pswitch_15
        :pswitch_12
        :pswitch_18
        :pswitch_1b
        :pswitch_1e
        :pswitch_21
        :pswitch_24
        :pswitch_27
        :pswitch_2a
    .end packed-switch
.end method
