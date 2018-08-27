#include <ui/GraphicBufferMapper.h>
#include <ui/Rect.h>
#include <media/openmax/OMX_Core.h>
#include <unistd.h>

extern "C" {
    //void _ZN7android19GraphicBufferMapper9lockYCbCrEPK13native_handlejRKNS_4RectEP13android_ycbcr(buffer_handle_t, uint32_t, const android::Rect&, android_ycbcr*);



	typedef android::Rect Rect;
	typedef int32_t   status_t;
	
	extern status_t _ZN7android19GraphicBufferMapper9lockYCbCrEPK13native_handlejRKNS_4RectEP13android_ycbcr(buffer_handle_t, uint32_t, const Rect&, android_ycbcr *);
		
    status_t _ZN7android19GraphicBufferMapper9lockYCbCrEPK13native_handleiRKNS_4RectEP13android_ycbcr(buffer_handle_t handle, int usage, const Rect& bounds, android_ycbcr *ycbcr){
		return _ZN7android19GraphicBufferMapper9lockYCbCrEPK13native_handlejRKNS_4RectEP13android_ycbcr(handle, static_cast<uint32_t>(usage), bounds, ycbcr);
        }
    
  
    extern status_t _ZN7android19GraphicBufferMapper4lockEPK13native_handlejRKNS_4RectEPPv(buffer_handle_t, uint32_t, const Rect&, void**);

	status_t _ZN7android19GraphicBufferMapper4lockEPK13native_handleiRKNS_4RectEPPv(buffer_handle_t handle, int usage, const Rect& bounds, void** vaddr){
       return _ZN7android19GraphicBufferMapper4lockEPK13native_handlejRKNS_4RectEPPv(handle, static_cast<uint32_t>(usage), bounds, vaddr);
     }

	extern unsigned int _ZN7android24getIMemoryFromBufferMetaEPv();

    extern unsigned int _ZN7android24getIMemoryFromBufferMetaEPv(){
		return NULL;
		}
		

	extern void _ZN7android5Fence4waitEi(int);

    extern void _ZN7android5Fence4waitEj(unsigned int timeout) {
		 //usleep(10000); // 10 millsec
        _ZN7android5Fence4waitEi(static_cast<int>(timeout));
    }	
	
	/*

   
    unsigned int _ZN7android3OMX17OnEmptyBufferDoneEjjP20OMX_BUFFERHEADERTYPE(unsigned int h, unsigned int b, OMX_BUFFERHEADERTYPE* bt){
        return NULL;
		}

    
		
    unsigned int _ZN7android3OMX16OnFillBufferDoneEjjP20OMX_BUFFERHEADERTYPE(unsigned int h, unsigned int b, OMX_BUFFERHEADERTYPE* bt){
		return NULL;
		}





    extern unsigned int _ZN7android3OMX17OnEmptyBufferDoneEjjP20OMX_BUFFERHEADERTYPEi(unsigned int h, unsigned int b , OMX_BUFFERHEADERTYPE* bt, int i){
		return 0;
		}
    
    unsigned int _ZN7android3OMX17OnEmptyBufferDoneEjjP20OMX_BUFFERHEADERTYPE(unsigned int h, unsigned int b, OMX_BUFFERHEADERTYPE* bt){
		int c=0;
		return _ZN7android3OMX17OnEmptyBufferDoneEjjP20OMX_BUFFERHEADERTYPEi(h,b,bt,c);
		}

    
    
    
    extern unsigned int _ZN7android3OMX16OnFillBufferDoneEjjP20OMX_BUFFERHEADERTYPEi(unsigned int h, unsigned int b , OMX_BUFFERHEADERTYPE* bt, int i){
		return 0;
		}
		
    unsigned int _ZN7android3OMX16OnFillBufferDoneEjjP20OMX_BUFFERHEADERTYPE(unsigned int h, unsigned int b, OMX_BUFFERHEADERTYPE* bt){
		int c=0;
		return _ZN7android3OMX16OnFillBufferDoneEjjP20OMX_BUFFERHEADERTYPEi(h,b,bt,c);
		}
*/

/*
    extern unsigned int _ZN7android19GraphicBufferSource18codecBufferEmptiedEP20OMX_BUFFERHEADERTYPEi(OMX_BUFFERHEADERTYPE* header, int x){
		return 0;
		}
    
    unsigned int _ZN7android19GraphicBufferSource18codecBufferEmptiedEP20OMX_BUFFERHEADERTYPE(OMX_BUFFERHEADERTYPE* header){
		return NULL;
		//return _ZN7android19GraphicBufferSource18codecBufferEmptiedEP20OMX_BUFFERHEADERTYPEi(header,0);
		} 



//    extern unsigned int _ZN7android19GraphicBufferSourceC1EPNS_15OMXNodeInstanceEjjjjRKNS_2spINS_22IGraphicBufferConsumerEEE(int* nodeInstance, uint32_t bufferWidth, uint32_t bufferHeight, uint32_t bufferCount){
//		return 0;
//		}
    
    unsigned int _ZN7android19GraphicBufferSourceC1EPNS_15OMXNodeInstanceEjjjb(int* nodeInstance, uint32_t bufferWidth, uint32_t bufferHeight, uint32_t bufferCount){
		return NULL;
		//return _ZN7android19GraphicBufferSourceC1EPNS_15OMXNodeInstanceEjjjjRKNS_2spINS_22IGraphicBufferConsumerEEE(nodeInstance,bufferWidth,bufferHeight,bufferCount);
//		}

/*
    void _ZN7android3OMX17OnEmptyBufferDoneEjhP20OMX_BUFFERHEADERTYPE(unsigned int, unsigned int, OMX_BUFFERHEADERTYPE*);
    
    void _ZN7android3OMX17OnEmptyBufferDoneEjhP20OMX_BUFFERHEADERTYPE(unsigned int a, unsigned int b, OMX_BUFFERHEADERTYPE* t){
		
		}
    
    void _ZN7android3OMX17OnEmptyBufferDoneEjjP20OMX_BUFFERHEADERTYPE(unsigned int, unsigned int, OMX_BUFFERHEADERTYPE*);
    
    extern void _ZN7android3OMX17OnEmptyBufferDoneEjjP20OMX_BUFFERHEADERTYPE(unsigned int a, unsigned int b, OMX_BUFFERHEADERTYPE* t){
		    _ZN7android3OMX17OnEmptyBufferDoneEjhP20OMX_BUFFERHEADERTYPE(a, b, t);
		 }
	
	    // _ZN7android3OMX16OnFillBufferDoneEjjP20OMX_BUFFERHEADERTYPE
    
    void _ZN7android3OMX16OnFillBufferDoneEjkP20OMX_BUFFERHEADERTYPE(){};
    
    extern void _ZN7android3OMX16OnFillBufferDoneEjjP20OMX_BUFFERHEADERTYPE(){
		_ZN7android3OMX16OnFillBufferDoneEjkP20OMX_BUFFERHEADERTYPE();
		};	 

/*

	void _ZN7android22IGraphicBufferConsumer10BufferItemC1Ek(){};

		 
	extern void _ZN7android22IGraphicBufferConsumer10BufferItemC1Ev(){
		_ZN7android22IGraphicBufferConsumer10BufferItemC1Ek();
		}	 

    void _ZN7android18BufferItemConsumer20setDefaultBufferSizeEjk(){};
    
    extern void _ZN7android18BufferItemConsumer20setDefaultBufferSizeEjj(){
		_ZN7android18BufferItemConsumer20setDefaultBufferSizeEjk();
		};
		

    
    void _ZN7android18BufferItemConsumer22setDefaultBufferFormatEk(){};
    extern void _ZN7android18BufferItemConsumer22setDefaultBufferFormatEj(){
		_ZN7android18BufferItemConsumer22setDefaultBufferFormatEk();
		}
*/
/*
    void _ZN7android19GraphicBufferSourceC1EPNS_15OMXNodeInstanceEjjjk(){};
	
	extern void _ZN7android19GraphicBufferSourceC1EPNS_15OMXNodeInstanceEjjjb(){
		_ZN7android19GraphicBufferSourceC1EPNS_15OMXNodeInstanceEjjjk();
		};
*/
/*
	
	void _ZN7android18BufferItemConsumer13acquireBufferEPNS_22IGraphicBufferConsumer10BufferItemExh(){};
	
	extern void _ZN7android18BufferItemConsumer13acquireBufferEPNS_22IGraphicBufferConsumer10BufferItemExb(){
		_ZN7android18BufferItemConsumer13acquireBufferEPNS_22IGraphicBufferConsumer10BufferItemExh();
		}	
	*/
	
}
