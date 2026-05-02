.class public Lcom/sun/mail/imap/protocol/FLAGS;
.super Lkorex/mail/Flags;
.source "FLAGS.java"

# interfaces
.implements Lcom/sun/mail/imap/protocol/Item;


# static fields
.field static final name:[C

.field private static final serialVersionUID:J = 0x617d1827c5428feL


# instance fields
.field public msgno:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 56
    const/4 v0, 0x5

    new-array v0, v0, [C

    fill-array-data v0, :array_a

    sput-object v0, Lcom/sun/mail/imap/protocol/FLAGS;->name:[C

    return-void

    nop

    :array_a
    .array-data 2
        0x46s
        0x4cs
        0x41s
        0x47s
        0x53s
    .end array-data
.end method

.method public constructor <init>(Lcom/sun/mail/imap/protocol/IMAPResponse;)V
    .registers 9
    .param p1, "r"    # Lcom/sun/mail/imap/protocol/IMAPResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x2

    .line 64
    invoke-direct {p0}, Lkorex/mail/Flags;-><init>()V

    .line 65
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPResponse;->getNumber()I

    move-result v4

    iput v4, p0, Lcom/sun/mail/imap/protocol/FLAGS;->msgno:I

    .line 67
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPResponse;->skipSpaces()V

    .line 68
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readSimpleList()[Ljava/lang/String;

    move-result-object v1

    .line 69
    .local v1, "flags":[Ljava/lang/String;
    if-eqz v1, :cond_87

    .line 70
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_14
    array-length v4, v1

    if-ge v2, v4, :cond_87

    .line 71
    aget-object v3, v1, v2

    .line 72
    .local v3, "s":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lt v4, v6, :cond_83

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x5c

    if-ne v4, v5, :cond_83

    .line 73
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v4

    sparse-switch v4, :sswitch_data_88

    .line 100
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/protocol/FLAGS;->add(Ljava/lang/String;)V

    .line 70
    :cond_37
    :goto_37
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 75
    :sswitch_3a
    sget-object v4, Lkorex/mail/Flags$Flag;->SEEN:Lkorex/mail/Flags$Flag;

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/protocol/FLAGS;->add(Lkorex/mail/Flags$Flag;)V

    goto :goto_37

    .line 78
    :sswitch_40
    sget-object v4, Lkorex/mail/Flags$Flag;->RECENT:Lkorex/mail/Flags$Flag;

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/protocol/FLAGS;->add(Lkorex/mail/Flags$Flag;)V

    goto :goto_37

    .line 81
    :sswitch_46
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x3

    if-lt v4, v5, :cond_6d

    .line 82
    invoke-virtual {v3, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 83
    .local v0, "c":C
    const/16 v4, 0x65

    if-eq v0, v4, :cond_59

    const/16 v4, 0x45

    if-ne v0, v4, :cond_5f

    .line 84
    :cond_59
    sget-object v4, Lkorex/mail/Flags$Flag;->DELETED:Lkorex/mail/Flags$Flag;

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/protocol/FLAGS;->add(Lkorex/mail/Flags$Flag;)V

    goto :goto_37

    .line 85
    :cond_5f
    const/16 v4, 0x72

    if-eq v0, v4, :cond_67

    const/16 v4, 0x52

    if-ne v0, v4, :cond_37

    .line 86
    :cond_67
    sget-object v4, Lkorex/mail/Flags$Flag;->DRAFT:Lkorex/mail/Flags$Flag;

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/protocol/FLAGS;->add(Lkorex/mail/Flags$Flag;)V

    goto :goto_37

    .line 88
    .end local v0    # "c":C
    :cond_6d
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/protocol/FLAGS;->add(Ljava/lang/String;)V

    goto :goto_37

    .line 91
    :sswitch_71
    sget-object v4, Lkorex/mail/Flags$Flag;->ANSWERED:Lkorex/mail/Flags$Flag;

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/protocol/FLAGS;->add(Lkorex/mail/Flags$Flag;)V

    goto :goto_37

    .line 94
    :sswitch_77
    sget-object v4, Lkorex/mail/Flags$Flag;->FLAGGED:Lkorex/mail/Flags$Flag;

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/protocol/FLAGS;->add(Lkorex/mail/Flags$Flag;)V

    goto :goto_37

    .line 97
    :sswitch_7d
    sget-object v4, Lkorex/mail/Flags$Flag;->USER:Lkorex/mail/Flags$Flag;

    invoke-virtual {p0, v4}, Lcom/sun/mail/imap/protocol/FLAGS;->add(Lkorex/mail/Flags$Flag;)V

    goto :goto_37

    .line 104
    :cond_83
    invoke-virtual {p0, v3}, Lcom/sun/mail/imap/protocol/FLAGS;->add(Ljava/lang/String;)V

    goto :goto_37

    .line 107
    .end local v2    # "i":I
    .end local v3    # "s":Ljava/lang/String;
    :cond_87
    return-void

    .line 73
    :sswitch_data_88
    .sparse-switch
        0x2a -> :sswitch_7d
        0x41 -> :sswitch_71
        0x44 -> :sswitch_46
        0x46 -> :sswitch_77
        0x52 -> :sswitch_40
        0x53 -> :sswitch_3a
    .end sparse-switch
.end method
