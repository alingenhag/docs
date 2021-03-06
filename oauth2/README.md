# Oauth2 and OpenID Connect notes

## Useful links

* [The OAuth 2.0 Authorization Framework](https://tools.ietf.org/html/rfc6749)
* [OAuth 2.0 \<debugger/\>](https://oauthdebugger.com)
* [JSON Web Tokens](https://jwt.io/)

## Useful links (Spring 5)
* [OAuth2 Resource Server](https://docs.spring.io/spring-security/site/docs/current/reference/htmlsingle/#webflux-oauth2-resource-server)
* [Reactive Spring Security 5.1 Hands-On Workshop](https://andifalk.github.io/reactive-spring-security-5-workshop/workshop-tutorial.html)
* [Joe Grandja - OAuth 2.0 Protocols and Patterns](https://github.com/jgrandja/oauth2-protocol-patterns.git)

## Useful videos
* [OAuth 2.0 and OpenID Connect (in plain English)](https://www.youtube.com/watch?v=996OiexHze0)
* [Securing OAuth 2.0 Resources in Spring Security 5.0](https://www.youtube.com/watch?v=1N-xwmoN83w)

## Terminology
* **Resource Owner**
  * Usually a user
* **Client**
  * The application that the user wants to access.
* **Authorization Server**
  * Where the user can authorize the client to access its data.
* **Authorization Grant**
  * Prove that the user has given the client access to the users protected resources.
* **Access Token**
  * Granted by the Authorization Server to the client in order to access the the *Resource Server*.
* **Redirect URI**
  * Where to redirect to after the authorization flow.
* **Resource Server**
  * Holds the data the client wants to access on behalf of the user.
* **Scope**
  * Permissions that the *Authorization Server* understands. The *Client* requests the *Scope(s)* it needs to access the
    *Resource Server*.