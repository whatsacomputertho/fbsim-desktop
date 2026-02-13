import '@whatsacomputertho/fbsim-ui/register';
import { WasmSimService, WACTGameSim } from '@whatsacomputertho/fbsim-ui';

(async (): Promise<void> => {
  try {
    const service = new WasmSimService();
    await service.initialize();

    await customElements.whenDefined('wact-game-sim');

    const gameSim = document.querySelector('wact-game-sim') as WACTGameSim;
    if (gameSim) {
      gameSim.setSimService(service);
    }
  } catch (error) {
    console.warn(
      'WasmSimService not available. Install @whatsacomputertho/fbsim-core to enable simulation.',
      error,
    );
  }
})();
