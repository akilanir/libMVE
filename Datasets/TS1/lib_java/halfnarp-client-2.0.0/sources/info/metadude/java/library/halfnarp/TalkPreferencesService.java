package info.metadude.java.library.halfnarp;

import info.metadude.java.library.halfnarp.model.CreateTalkPreferencesSuccessResponse;
import info.metadude.java.library.halfnarp.model.GetTalkPreferencesSuccessResponse;
import info.metadude.java.library.halfnarp.model.GetTalksResponse;
import info.metadude.java.library.halfnarp.model.TalkIds;
import info.metadude.java.library.halfnarp.model.UpdateTalkPreferencesSuccessResponse;
import java.util.List;
import retrofit.Call;
import retrofit.http.Body;
import retrofit.http.GET;
import retrofit.http.POST;
import retrofit.http.PUT;
import retrofit.http.Path;

/* loaded from: halfnarp-client-2.0.0.jar:info/metadude/java/library/halfnarp/TalkPreferencesService.class */
public interface TalkPreferencesService {
    public static final String BASE_URL = "http://halfnarp.events.ccc.de";

    @GET("/-/talkpreferences")
    Call<List<GetTalksResponse>> getTalks();

    @POST("/-/talkpreferences")
    Call<CreateTalkPreferencesSuccessResponse> createTalkPreferences(@Body TalkIds talkIds);

    @PUT("/-/talkpreferences/{uniqueId}")
    Call<UpdateTalkPreferencesSuccessResponse> updateTalkPreferences(@Path("uniqueId") String str, @Body TalkIds talkIds);

    @GET("/-/talkpreferences/{uniqueId}")
    Call<GetTalkPreferencesSuccessResponse> getTalkPreferences(@Path("uniqueId") String str);
}
