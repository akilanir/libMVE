.class public Lkorex/mail/internet/ContentDisposition;
.super Ljava/lang/Object;
.source "ContentDisposition.java"


# instance fields
.field private disposition:Ljava/lang/String;

.field private list:Lkorex/mail/internet/ParameterList;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 8
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/ParseException;
        }
    .end annotation

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    new-instance v0, Lkorex/mail/internet/HeaderTokenizer;

    const-string v3, "()<>@,;:\\\"\t []/?="

    invoke-direct {v0, p1, v3}, Lkorex/mail/internet/HeaderTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .local v0, "h":Lkorex/mail/internet/HeaderTokenizer;
    invoke-virtual {v0}, Lkorex/mail/internet/HeaderTokenizer;->next()Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v2

    .line 93
    .local v2, "tk":Lkorex/mail/internet/HeaderTokenizer$Token;
    invoke-virtual {v2}, Lkorex/mail/internet/HeaderTokenizer$Token;->getType()I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_32

    .line 94
    new-instance v3, Lkorex/mail/internet/ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Expected disposition, got "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 95
    invoke-virtual {v2}, Lkorex/mail/internet/HeaderTokenizer$Token;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 96
    :cond_32
    invoke-virtual {v2}, Lkorex/mail/internet/HeaderTokenizer$Token;->getValue()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lkorex/mail/internet/ContentDisposition;->disposition:Ljava/lang/String;

    .line 99
    invoke-virtual {v0}, Lkorex/mail/internet/HeaderTokenizer;->getRemainder()Ljava/lang/String;

    move-result-object v1

    .line 100
    .local v1, "rem":Ljava/lang/String;
    if-eqz v1, :cond_45

    .line 101
    new-instance v3, Lkorex/mail/internet/ParameterList;

    invoke-direct {v3, v1}, Lkorex/mail/internet/ParameterList;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lkorex/mail/internet/ContentDisposition;->list:Lkorex/mail/internet/ParameterList;

    .line 102
    :cond_45
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lkorex/mail/internet/ParameterList;)V
    .registers 3
    .param p1, "disposition"    # Ljava/lang/String;
    .param p2, "list"    # Lkorex/mail/internet/ParameterList;

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object p1, p0, Lkorex/mail/internet/ContentDisposition;->disposition:Ljava/lang/String;

    .line 75
    iput-object p2, p0, Lkorex/mail/internet/ContentDisposition;->list:Lkorex/mail/internet/ParameterList;

    .line 76
    return-void
.end method


# virtual methods
.method public getDisposition()Ljava/lang/String;
    .registers 2

    .prologue
    .line 110
    iget-object v0, p0, Lkorex/mail/internet/ContentDisposition;->disposition:Ljava/lang/String;

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 122
    iget-object v0, p0, Lkorex/mail/internet/ContentDisposition;->list:Lkorex/mail/internet/ParameterList;

    if-nez v0, :cond_6

    .line 123
    const/4 v0, 0x0

    .line 125
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lkorex/mail/internet/ContentDisposition;->list:Lkorex/mail/internet/ParameterList;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/ParameterList;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method public getParameterList()Lkorex/mail/internet/ParameterList;
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lkorex/mail/internet/ContentDisposition;->list:Lkorex/mail/internet/ParameterList;

    return-object v0
.end method

.method public setDisposition(Ljava/lang/String;)V
    .registers 2
    .param p1, "disposition"    # Ljava/lang/String;

    .prologue
    .line 145
    iput-object p1, p0, Lkorex/mail/internet/ContentDisposition;->disposition:Ljava/lang/String;

    .line 146
    return-void
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 157
    iget-object v0, p0, Lkorex/mail/internet/ContentDisposition;->list:Lkorex/mail/internet/ParameterList;

    if-nez v0, :cond_b

    .line 158
    new-instance v0, Lkorex/mail/internet/ParameterList;

    invoke-direct {v0}, Lkorex/mail/internet/ParameterList;-><init>()V

    iput-object v0, p0, Lkorex/mail/internet/ContentDisposition;->list:Lkorex/mail/internet/ParameterList;

    .line 160
    :cond_b
    iget-object v0, p0, Lkorex/mail/internet/ContentDisposition;->list:Lkorex/mail/internet/ParameterList;

    invoke-virtual {v0, p1, p2}, Lkorex/mail/internet/ParameterList;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    return-void
.end method

.method public setParameterList(Lkorex/mail/internet/ParameterList;)V
    .registers 2
    .param p1, "list"    # Lkorex/mail/internet/ParameterList;

    .prologue
    .line 169
    iput-object p1, p0, Lkorex/mail/internet/ContentDisposition;->list:Lkorex/mail/internet/ParameterList;

    .line 170
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 181
    iget-object v1, p0, Lkorex/mail/internet/ContentDisposition;->disposition:Ljava/lang/String;

    if-nez v1, :cond_7

    .line 182
    const-string v1, ""

    .line 193
    :goto_6
    return-object v1

    .line 184
    :cond_7
    iget-object v1, p0, Lkorex/mail/internet/ContentDisposition;->list:Lkorex/mail/internet/ParameterList;

    if-nez v1, :cond_e

    .line 185
    iget-object v1, p0, Lkorex/mail/internet/ContentDisposition;->disposition:Ljava/lang/String;

    goto :goto_6

    .line 187
    :cond_e
    new-instance v0, Ljava/lang/StringBuffer;

    iget-object v1, p0, Lkorex/mail/internet/ContentDisposition;->disposition:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 192
    .local v0, "sb":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lkorex/mail/internet/ContentDisposition;->list:Lkorex/mail/internet/ParameterList;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x15

    invoke-virtual {v1, v2}, Lkorex/mail/internet/ParameterList;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 193
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_6
.end method
