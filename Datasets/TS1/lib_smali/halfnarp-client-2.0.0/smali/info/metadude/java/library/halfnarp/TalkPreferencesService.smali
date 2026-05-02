.class public interface abstract Linfo/metadude/java/library/halfnarp/TalkPreferencesService;
.super Ljava/lang/Object;
.source "TalkPreferencesService.java"


# static fields
.field public static final BASE_URL:Ljava/lang/String; = "http://halfnarp.events.ccc.de"


# virtual methods
.method public abstract createTalkPreferences(Linfo/metadude/java/library/halfnarp/model/TalkIds;)Lretrofit/Call;
    .param p1    # Linfo/metadude/java/library/halfnarp/model/TalkIds;
        .annotation runtime Lretrofit/http/Body;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Linfo/metadude/java/library/halfnarp/model/TalkIds;",
            ")",
            "Lretrofit/Call",
            "<",
            "Linfo/metadude/java/library/halfnarp/model/CreateTalkPreferencesSuccessResponse;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit/http/POST;
        value = "/-/talkpreferences"
    .end annotation
.end method

.method public abstract getTalkPreferences(Ljava/lang/String;)Lretrofit/Call;
    .param p1    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Path;
            value = "uniqueId"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lretrofit/Call",
            "<",
            "Linfo/metadude/java/library/halfnarp/model/GetTalkPreferencesSuccessResponse;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit/http/GET;
        value = "/-/talkpreferences/{uniqueId}"
    .end annotation
.end method

.method public abstract getTalks()Lretrofit/Call;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lretrofit/Call",
            "<",
            "Ljava/util/List",
            "<",
            "Linfo/metadude/java/library/halfnarp/model/GetTalksResponse;",
            ">;>;"
        }
    .end annotation

    .annotation runtime Lretrofit/http/GET;
        value = "/-/talkpreferences"
    .end annotation
.end method

.method public abstract updateTalkPreferences(Ljava/lang/String;Linfo/metadude/java/library/halfnarp/model/TalkIds;)Lretrofit/Call;
    .param p1    # Ljava/lang/String;
        .annotation runtime Lretrofit/http/Path;
            value = "uniqueId"
        .end annotation
    .end param
    .param p2    # Linfo/metadude/java/library/halfnarp/model/TalkIds;
        .annotation runtime Lretrofit/http/Body;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Linfo/metadude/java/library/halfnarp/model/TalkIds;",
            ")",
            "Lretrofit/Call",
            "<",
            "Linfo/metadude/java/library/halfnarp/model/UpdateTalkPreferencesSuccessResponse;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit/http/PUT;
        value = "/-/talkpreferences/{uniqueId}"
    .end annotation
.end method
