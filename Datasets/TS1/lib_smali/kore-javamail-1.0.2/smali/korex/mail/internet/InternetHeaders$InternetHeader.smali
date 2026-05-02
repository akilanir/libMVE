.class public final Lkorex/mail/internet/InternetHeaders$InternetHeader;
.super Lkorex/mail/Header;
.source "InternetHeaders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/internet/InternetHeaders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1c
    name = "InternetHeader"
.end annotation


# instance fields
.field line:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 5
    .param p1, "l"    # Ljava/lang/String;

    .prologue
    .line 122
    const-string v1, ""

    const-string v2, ""

    invoke-direct {p0, v1, v2}, Lkorex/mail/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    const/16 v1, 0x3a

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 124
    .local v0, "i":I
    if-gez v0, :cond_18

    .line 126
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lkorex/mail/internet/InternetHeaders$InternetHeader;->name:Ljava/lang/String;

    .line 130
    :goto_15
    iput-object p1, p0, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    .line 131
    return-void

    .line 128
    :cond_18
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lkorex/mail/internet/InternetHeaders$InternetHeader;->name:Ljava/lang/String;

    goto :goto_15
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "n"    # Ljava/lang/String;
    .param p2, "v"    # Ljava/lang/String;

    .prologue
    .line 140
    const-string v0, ""

    invoke-direct {p0, p1, v0}, Lkorex/mail/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    if-eqz p2, :cond_21

    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    .line 145
    :goto_20
    return-void

    .line 144
    :cond_21
    const/4 v0, 0x0

    iput-object v0, p0, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    goto :goto_20
.end method


# virtual methods
.method public getValue()Ljava/lang/String;
    .registers 6

    .prologue
    .line 151
    iget-object v3, p0, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    const/16 v4, 0x3a

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 152
    .local v1, "i":I
    if-gez v1, :cond_d

    .line 153
    iget-object v3, p0, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    .line 161
    :goto_c
    return-object v3

    .line 156
    :cond_d
    add-int/lit8 v2, v1, 0x1

    .local v2, "j":I
    :goto_f
    iget-object v3, p0, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_2d

    .line 157
    iget-object v3, p0, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 158
    .local v0, "c":C
    const/16 v3, 0x20

    if-eq v0, v3, :cond_34

    const/16 v3, 0x9

    if-eq v0, v3, :cond_34

    const/16 v3, 0xd

    if-eq v0, v3, :cond_34

    const/16 v3, 0xa

    if-eq v0, v3, :cond_34

    .line 161
    .end local v0    # "c":C
    :cond_2d
    iget-object v3, p0, Lkorex/mail/internet/InternetHeaders$InternetHeader;->line:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_c

    .line 156
    .restart local v0    # "c":C
    :cond_34
    add-int/lit8 v2, v2, 0x1

    goto :goto_f
.end method
