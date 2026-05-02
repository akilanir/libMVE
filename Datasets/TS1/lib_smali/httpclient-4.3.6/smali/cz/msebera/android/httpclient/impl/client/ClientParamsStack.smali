.class public Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;
.super Lcz/msebera/android/httpclient/params/AbstractHttpParams;
.source "ClientParamsStack.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field protected final applicationParams:Lcz/msebera/android/httpclient/params/HttpParams;

.field protected final clientParams:Lcz/msebera/android/httpclient/params/HttpParams;

.field protected final overrideParams:Lcz/msebera/android/httpclient/params/HttpParams;

.field protected final requestParams:Lcz/msebera/android/httpclient/params/HttpParams;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;)V
    .registers 6
    .param p1, "stack"    # Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;

    .prologue
    .line 116
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->getApplicationParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v0

    .line 117
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->getClientParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v1

    .line 118
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->getRequestParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v2

    .line 119
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->getOverrideParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v3

    .line 116
    invoke-direct {p0, v0, v1, v2, v3}, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;-><init>(Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;)V

    .line 120
    return-void
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;)V
    .registers 6
    .param p1, "stack"    # Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;
    .param p2, "aparams"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .param p3, "cparams"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .param p4, "rparams"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .param p5, "oparams"    # Lcz/msebera/android/httpclient/params/HttpParams;

    .prologue
    .line 139
    if-eqz p2, :cond_c

    .end local p2    # "aparams":Lcz/msebera/android/httpclient/params/HttpParams;
    :goto_2
    if-eqz p3, :cond_11

    .line 140
    .end local p3    # "cparams":Lcz/msebera/android/httpclient/params/HttpParams;
    :goto_4
    if-eqz p4, :cond_16

    .line 141
    .end local p4    # "rparams":Lcz/msebera/android/httpclient/params/HttpParams;
    :goto_6
    if-eqz p5, :cond_1b

    .line 139
    .end local p5    # "oparams":Lcz/msebera/android/httpclient/params/HttpParams;
    :goto_8
    invoke-direct {p0, p2, p3, p4, p5}, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;-><init>(Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;)V

    .line 143
    return-void

    .line 139
    .restart local p2    # "aparams":Lcz/msebera/android/httpclient/params/HttpParams;
    .restart local p3    # "cparams":Lcz/msebera/android/httpclient/params/HttpParams;
    .restart local p4    # "rparams":Lcz/msebera/android/httpclient/params/HttpParams;
    .restart local p5    # "oparams":Lcz/msebera/android/httpclient/params/HttpParams;
    :cond_c
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->getApplicationParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object p2

    goto :goto_2

    .line 140
    .end local p2    # "aparams":Lcz/msebera/android/httpclient/params/HttpParams;
    :cond_11
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->getClientParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object p3

    goto :goto_4

    .line 141
    .end local p3    # "cparams":Lcz/msebera/android/httpclient/params/HttpParams;
    :cond_16
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->getRequestParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object p4

    goto :goto_6

    .line 142
    .end local p4    # "rparams":Lcz/msebera/android/httpclient/params/HttpParams;
    :cond_1b
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->getOverrideParams()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object p5

    goto :goto_8
.end method

.method public constructor <init>(Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;)V
    .registers 5
    .param p1, "aparams"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .param p2, "cparams"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .param p3, "rparams"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .param p4, "oparams"    # Lcz/msebera/android/httpclient/params/HttpParams;

    .prologue
    .line 100
    invoke-direct {p0}, Lcz/msebera/android/httpclient/params/AbstractHttpParams;-><init>()V

    .line 101
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->applicationParams:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 102
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->clientParams:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 103
    iput-object p3, p0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->requestParams:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 104
    iput-object p4, p0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->overrideParams:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 105
    return-void
.end method


# virtual methods
.method public copy()Lcz/msebera/android/httpclient/params/HttpParams;
    .registers 1

    .prologue
    .line 265
    return-object p0
.end method

.method public final getApplicationParams()Lcz/msebera/android/httpclient/params/HttpParams;
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->applicationParams:Lcz/msebera/android/httpclient/params/HttpParams;

    return-object v0
.end method

.method public final getClientParams()Lcz/msebera/android/httpclient/params/HttpParams;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->clientParams:Lcz/msebera/android/httpclient/params/HttpParams;

    return-object v0
.end method

.method public final getOverrideParams()Lcz/msebera/android/httpclient/params/HttpParams;
    .registers 2

    .prologue
    .line 179
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->overrideParams:Lcz/msebera/android/httpclient/params/HttpParams;

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 193
    const-string v1, "Parameter name"

    invoke-static {p1, v1}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 195
    const/4 v0, 0x0

    .line 197
    .local v0, "result":Ljava/lang/Object;
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->overrideParams:Lcz/msebera/android/httpclient/params/HttpParams;

    if-eqz v1, :cond_10

    .line 198
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->overrideParams:Lcz/msebera/android/httpclient/params/HttpParams;

    invoke-interface {v1, p1}, Lcz/msebera/android/httpclient/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 200
    .end local v0    # "result":Ljava/lang/Object;
    :cond_10
    if-nez v0, :cond_1c

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->requestParams:Lcz/msebera/android/httpclient/params/HttpParams;

    if-eqz v1, :cond_1c

    .line 201
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->requestParams:Lcz/msebera/android/httpclient/params/HttpParams;

    invoke-interface {v1, p1}, Lcz/msebera/android/httpclient/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 203
    :cond_1c
    if-nez v0, :cond_28

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->clientParams:Lcz/msebera/android/httpclient/params/HttpParams;

    if-eqz v1, :cond_28

    .line 204
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->clientParams:Lcz/msebera/android/httpclient/params/HttpParams;

    invoke-interface {v1, p1}, Lcz/msebera/android/httpclient/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 206
    :cond_28
    if-nez v0, :cond_34

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->applicationParams:Lcz/msebera/android/httpclient/params/HttpParams;

    if-eqz v1, :cond_34

    .line 207
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->applicationParams:Lcz/msebera/android/httpclient/params/HttpParams;

    invoke-interface {v1, p1}, Lcz/msebera/android/httpclient/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 209
    :cond_34
    return-object v0
.end method

.method public final getRequestParams()Lcz/msebera/android/httpclient/params/HttpParams;
    .registers 2

    .prologue
    .line 170
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/ClientParamsStack;->requestParams:Lcz/msebera/android/httpclient/params/HttpParams;

    return-object v0
.end method

.method public removeParameter(Ljava/lang/String;)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 246
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Removing parameters in a stack is not supported."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/params/HttpParams;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .prologue
    .line 228
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Setting parameters in a stack is not supported."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
