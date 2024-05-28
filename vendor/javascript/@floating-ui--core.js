import{getSideAxis as t,getAlignmentAxis as e,getAxisLength as n,getSide as o,getAlignment as s,evaluate as c,getPaddingObject as i,rectToClientRect as r,min as l,clamp as a,getOppositeAlignmentPlacement as f,placements as m,getAlignmentSides as u,getOppositePlacement as d,getExpandedPlacements as g,getOppositeAxisPlacements as p,sides as h,max as y,getOppositeAxis as w}from"@floating-ui/utils";export{rectToClientRect}from"@floating-ui/utils";function computeCoordsFromPlacement(c,i,r){let{reference:l,floating:a}=c;const f=t(i);const m=e(i);const u=n(m);const d=o(i);const g=f==="y";const p=l.x+l.width/2-a.width/2;const h=l.y+l.height/2-a.height/2;const y=l[u]/2-a[u]/2;let w;switch(d){case"top":w={x:p,y:l.y-a.height};break;case"bottom":w={x:p,y:l.y+l.height};break;case"right":w={x:l.x+l.width,y:h};break;case"left":w={x:l.x-a.width,y:h};break;default:w={x:l.x,y:l.y}}switch(s(i)){case"start":w[m]-=y*(r&&g?-1:1);break;case"end":w[m]+=y*(r&&g?-1:1);break}return w}const computePosition=async(t,e,n)=>{const{placement:o="bottom",strategy:s="absolute",middleware:c=[],platform:i}=n;const r=c.filter(Boolean);const l=await(i.isRTL==null?void 0:i.isRTL(e));let a=await i.getElementRects({reference:t,floating:e,strategy:s});let{x:f,y:m}=computeCoordsFromPlacement(a,o,l);let u=o;let d={};let g=0;for(let n=0;n<r.length;n++){const{name:c,fn:p}=r[n];const{x:h,y:y,data:w,reset:v}=await p({x:f,y:m,initialPlacement:o,placement:u,strategy:s,middlewareData:d,rects:a,platform:i,elements:{reference:t,floating:e}});f=h!=null?h:f;m=y!=null?y:m;d={...d,[c]:{...d[c],...w}};if(v&&g<=50){g++;if(typeof v==="object"){v.placement&&(u=v.placement);v.rects&&(a=v.rects===true?await i.getElementRects({reference:t,floating:e,strategy:s}):v.rects);({x:f,y:m}=computeCoordsFromPlacement(a,u,l))}n=-1}}return{x:f,y:m,placement:u,strategy:s,middlewareData:d}};async function detectOverflow(t,e){var n;e===void 0&&(e={});const{x:o,y:s,platform:l,rects:a,elements:f,strategy:m}=t;const{boundary:u="clippingAncestors",rootBoundary:d="viewport",elementContext:g="floating",altBoundary:p=false,padding:h=0}=c(e,t);const y=i(h);const w=g==="floating"?"reference":"floating";const v=f[p?w:g];const x=r(await l.getClippingRect({element:(n=await(l.isElement==null?void 0:l.isElement(v)))==null||n?v:v.contextElement||await(l.getDocumentElement==null?void 0:l.getDocumentElement(f.floating)),boundary:u,rootBoundary:d,strategy:m}));const b=g==="floating"?{x:o,y:s,width:a.floating.width,height:a.floating.height}:a.reference;const R=await(l.getOffsetParent==null?void 0:l.getOffsetParent(f.floating));const A=await(l.isElement==null?void 0:l.isElement(R))&&await(l.getScale==null?void 0:l.getScale(R))||{x:1,y:1};const O=r(l.convertOffsetParentRelativeRectToViewportRelativeRect?await l.convertOffsetParentRelativeRectToViewportRelativeRect({elements:f,rect:b,offsetParent:R,strategy:m}):b);return{top:(x.top-O.top+y.top)/A.y,bottom:(O.bottom-x.bottom+y.bottom)/A.y,left:(x.left-O.left+y.left)/A.x,right:(O.right-x.right+y.right)/A.x}}const arrow=t=>({name:"arrow",options:t,async fn(o){const{x:r,y:f,placement:m,rects:u,platform:d,elements:g,middlewareData:p}=o;const{element:h,padding:y=0}=c(t,o)||{};if(h==null)return{};const w=i(y);const v={x:r,y:f};const x=e(m);const b=n(x);const R=await d.getDimensions(h);const A=x==="y";const O=A?"top":"left";const P=A?"bottom":"right";const C=A?"clientHeight":"clientWidth";const T=u.reference[b]+u.reference[x]-v[x]-u.floating[b];const L=v[x]-u.reference[x];const B=await(d.getOffsetParent==null?void 0:d.getOffsetParent(h));let D=B?B[C]:0;D&&await(d.isElement==null?void 0:d.isElement(B))||(D=g.floating[C]||u.floating[b]);const E=T/2-L/2;const k=D/2-R[b]/2-1;const S=l(w[O],k);const F=l(w[P],k);const H=S;const V=D-R[b]-F;const W=D/2-R[b]/2+E;const j=a(H,W,V);const z=!p.arrow&&s(m)!=null&&W!==j&&u.reference[b]/2-(W<H?S:F)-R[b]/2<0;const q=z?W<H?W-H:W-V:0;return{[x]:v[x]+q,data:{[x]:j,centerOffset:W-j-q,...z&&{alignmentOffset:q}},reset:z}}});function getPlacementList(t,e,n){const c=t?[...n.filter((e=>s(e)===t)),...n.filter((e=>s(e)!==t))]:n.filter((t=>o(t)===t));return c.filter((n=>!t||(s(n)===t||!!e&&f(n)!==n)))}const autoPlacement=function(t){t===void 0&&(t={});return{name:"autoPlacement",options:t,async fn(e){var n,i,r;const{rects:l,middlewareData:a,placement:f,platform:d,elements:g}=e;const{crossAxis:p=false,alignment:h,allowedPlacements:y=m,autoAlignment:w=true,...v}=c(t,e);const x=h!==void 0||y===m?getPlacementList(h||null,w,y):y;const b=await detectOverflow(e,v);const R=((n=a.autoPlacement)==null?void 0:n.index)||0;const A=x[R];if(A==null)return{};const O=u(A,l,await(d.isRTL==null?void 0:d.isRTL(g.floating)));if(f!==A)return{reset:{placement:x[0]}};const P=[b[o(A)],b[O[0]],b[O[1]]];const C=[...((i=a.autoPlacement)==null?void 0:i.overflows)||[],{placement:A,overflows:P}];const T=x[R+1];if(T)return{data:{index:R+1,overflows:C},reset:{placement:T}};const L=C.map((t=>{const e=s(t.placement);return[t.placement,e&&p?t.overflows.slice(0,2).reduce(((t,e)=>t+e),0):t.overflows[0],t.overflows]})).sort(((t,e)=>t[1]-e[1]));const B=L.filter((t=>t[2].slice(0,s(t[0])?2:3).every((t=>t<=0))));const D=((r=B[0])==null?void 0:r[0])||L[0][0];return D!==f?{data:{index:R+1,overflows:C},reset:{placement:D}}:{}}}};const flip=function(t){t===void 0&&(t={});return{name:"flip",options:t,async fn(e){var n,s;const{placement:i,middlewareData:r,rects:l,initialPlacement:a,platform:f,elements:m}=e;const{mainAxis:h=true,crossAxis:y=true,fallbackPlacements:w,fallbackStrategy:v="bestFit",fallbackAxisSideDirection:x="none",flipAlignment:b=true,...R}=c(t,e);if((n=r.arrow)!=null&&n.alignmentOffset)return{};const A=o(i);const O=o(a)===a;const P=await(f.isRTL==null?void 0:f.isRTL(m.floating));const C=w||(O||!b?[d(a)]:g(a));w||x==="none"||C.push(...p(a,b,x,P));const T=[a,...C];const L=await detectOverflow(e,R);const B=[];let D=((s=r.flip)==null?void 0:s.overflows)||[];h&&B.push(L[A]);if(y){const t=u(i,l,P);B.push(L[t[0]],L[t[1]])}D=[...D,{placement:i,overflows:B}];if(!B.every((t=>t<=0))){var E,k;const t=(((E=r.flip)==null?void 0:E.index)||0)+1;const e=T[t];if(e)return{data:{index:t,overflows:D},reset:{placement:e}};let n=(k=D.filter((t=>t.overflows[0]<=0)).sort(((t,e)=>t.overflows[1]-e.overflows[1]))[0])==null?void 0:k.placement;if(!n)switch(v){case"bestFit":{var S;const t=(S=D.map((t=>[t.placement,t.overflows.filter((t=>t>0)).reduce(((t,e)=>t+e),0)])).sort(((t,e)=>t[1]-e[1]))[0])==null?void 0:S[0];t&&(n=t);break}case"initialPlacement":n=a;break}if(i!==n)return{reset:{placement:n}}}return{}}}};function getSideOffsets(t,e){return{top:t.top-e.height,right:t.right-e.width,bottom:t.bottom-e.height,left:t.left-e.width}}function isAnySideFullyClipped(t){return h.some((e=>t[e]>=0))}const hide=function(t){t===void 0&&(t={});return{name:"hide",options:t,async fn(e){const{rects:n}=e;const{strategy:o="referenceHidden",...s}=c(t,e);switch(o){case"referenceHidden":{const t=await detectOverflow(e,{...s,elementContext:"reference"});const o=getSideOffsets(t,n.reference);return{data:{referenceHiddenOffsets:o,referenceHidden:isAnySideFullyClipped(o)}}}case"escaped":{const t=await detectOverflow(e,{...s,altBoundary:true});const o=getSideOffsets(t,n.floating);return{data:{escapedOffsets:o,escaped:isAnySideFullyClipped(o)}}}default:return{}}}}};function getBoundingRect(t){const e=l(...t.map((t=>t.left)));const n=l(...t.map((t=>t.top)));const o=y(...t.map((t=>t.right)));const s=y(...t.map((t=>t.bottom)));return{x:e,y:n,width:o-e,height:s-n}}function getRectsByLine(t){const e=t.slice().sort(((t,e)=>t.y-e.y));const n=[];let o=null;for(let t=0;t<e.length;t++){const s=e[t];!o||s.y-o.y>o.height/2?n.push([s]):n[n.length-1].push(s);o=s}return n.map((t=>r(getBoundingRect(t))))}const inline=function(e){e===void 0&&(e={});return{name:"inline",options:e,async fn(n){const{placement:s,elements:a,rects:f,platform:m,strategy:u}=n;const{padding:d=2,x:g,y:p}=c(e,n);const h=Array.from(await(m.getClientRects==null?void 0:m.getClientRects(a.reference))||[]);const w=getRectsByLine(h);const v=r(getBoundingRect(h));const x=i(d);function getBoundingClientRect(){if(w.length===2&&w[0].left>w[1].right&&g!=null&&p!=null)return w.find((t=>g>t.left-x.left&&g<t.right+x.right&&p>t.top-x.top&&p<t.bottom+x.bottom))||v;if(w.length>=2){if(t(s)==="y"){const t=w[0];const e=w[w.length-1];const n=o(s)==="top";const c=t.top;const i=e.bottom;const r=n?t.left:e.left;const l=n?t.right:e.right;const a=l-r;const f=i-c;return{top:c,bottom:i,left:r,right:l,width:a,height:f,x:r,y:c}}const e=o(s)==="left";const n=y(...w.map((t=>t.right)));const c=l(...w.map((t=>t.left)));const i=w.filter((t=>e?t.left===c:t.right===n));const r=i[0].top;const a=i[i.length-1].bottom;const f=c;const m=n;const u=m-f;const d=a-r;return{top:r,bottom:a,left:f,right:m,width:u,height:d,x:f,y:r}}return v}const b=await m.getElementRects({reference:{getBoundingClientRect:getBoundingClientRect},floating:a.floating,strategy:u});return f.reference.x!==b.reference.x||f.reference.y!==b.reference.y||f.reference.width!==b.reference.width||f.reference.height!==b.reference.height?{reset:{rects:b}}:{}}}};async function convertValueToCoords(e,n){const{placement:i,platform:r,elements:l}=e;const a=await(r.isRTL==null?void 0:r.isRTL(l.floating));const f=o(i);const m=s(i);const u=t(i)==="y";const d=["left","top"].includes(f)?-1:1;const g=a&&u?-1:1;const p=c(n,e);let{mainAxis:h,crossAxis:y,alignmentAxis:w}=typeof p==="number"?{mainAxis:p,crossAxis:0,alignmentAxis:null}:{mainAxis:0,crossAxis:0,alignmentAxis:null,...p};m&&typeof w==="number"&&(y=m==="end"?w*-1:w);return u?{x:y*g,y:h*d}:{x:h*d,y:y*g}}const offset=function(t){t===void 0&&(t=0);return{name:"offset",options:t,async fn(e){var n,o;const{x:s,y:c,placement:i,middlewareData:r}=e;const l=await convertValueToCoords(e,t);return i===((n=r.offset)==null?void 0:n.placement)&&(o=r.arrow)!=null&&o.alignmentOffset?{}:{x:s+l.x,y:c+l.y,data:{...l,placement:i}}}}};const shift=function(e){e===void 0&&(e={});return{name:"shift",options:e,async fn(n){const{x:s,y:i,placement:r}=n;const{mainAxis:l=true,crossAxis:f=false,limiter:m={fn:t=>{let{x:e,y:n}=t;return{x:e,y:n}}},...u}=c(e,n);const d={x:s,y:i};const g=await detectOverflow(n,u);const p=t(o(r));const h=w(p);let y=d[h];let v=d[p];if(l){const t=h==="y"?"top":"left";const e=h==="y"?"bottom":"right";const n=y+g[t];const o=y-g[e];y=a(n,y,o)}if(f){const t=p==="y"?"top":"left";const e=p==="y"?"bottom":"right";const n=v+g[t];const o=v-g[e];v=a(n,v,o)}const x=m.fn({...n,[h]:y,[p]:v});return{...x,data:{x:x.x-s,y:x.y-i}}}}};const limitShift=function(e){e===void 0&&(e={});return{options:e,fn(n){const{x:s,y:i,placement:r,rects:l,middlewareData:a}=n;const{offset:f=0,mainAxis:m=true,crossAxis:u=true}=c(e,n);const d={x:s,y:i};const g=t(r);const p=w(g);let h=d[p];let y=d[g];const v=c(f,n);const x=typeof v==="number"?{mainAxis:v,crossAxis:0}:{mainAxis:0,crossAxis:0,...v};if(m){const t=p==="y"?"height":"width";const e=l.reference[p]-l.floating[t]+x.mainAxis;const n=l.reference[p]+l.reference[t]-x.mainAxis;h<e?h=e:h>n&&(h=n)}if(u){var b,R;const t=p==="y"?"width":"height";const e=["top","left"].includes(o(r));const n=l.reference[g]-l.floating[t]+(e&&((b=a.offset)==null?void 0:b[g])||0)+(e?0:x.crossAxis);const s=l.reference[g]+l.reference[t]+(e?0:((R=a.offset)==null?void 0:R[g])||0)-(e?x.crossAxis:0);y<n?y=n:y>s&&(y=s)}return{[p]:h,[g]:y}}}};const size=function(e){e===void 0&&(e={});return{name:"size",options:e,async fn(n){const{placement:i,rects:r,platform:a,elements:f}=n;const{apply:m=(()=>{}),...u}=c(e,n);const d=await detectOverflow(n,u);const g=o(i);const p=s(i);const h=t(i)==="y";const{width:w,height:v}=r.floating;let x;let b;if(g==="top"||g==="bottom"){x=g;b=p===(await(a.isRTL==null?void 0:a.isRTL(f.floating))?"start":"end")?"left":"right"}else{b=g;x=p==="end"?"top":"bottom"}const R=v-d.top-d.bottom;const A=w-d.left-d.right;const O=l(v-d[x],R);const P=l(w-d[b],A);const C=!n.middlewareData.shift;let T=O;let L=P;h?L=p||C?l(P,A):A:T=p||C?l(O,R):R;if(C&&!p){const t=y(d.left,0);const e=y(d.right,0);const n=y(d.top,0);const o=y(d.bottom,0);h?L=w-2*(t!==0||e!==0?t+e:y(d.left,d.right)):T=v-2*(n!==0||o!==0?n+o:y(d.top,d.bottom))}await m({...n,availableWidth:L,availableHeight:T});const B=await a.getDimensions(f.floating);return w!==B.width||v!==B.height?{reset:{rects:true}}:{}}}};export{arrow,autoPlacement,computePosition,detectOverflow,flip,hide,inline,limitShift,offset,shift,size};
